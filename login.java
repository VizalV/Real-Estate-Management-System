import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class login extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String email = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();

        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            // to check if email exists
            String Sql = "select * from users where email=?";
            PreparedStatement ps = con.prepareStatement(Sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            RequestDispatcher rd = null;
            if (rs.next()) {
            } else {
                req.setAttribute("status", "notexist");
                rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, res);
            }

            // user login
            Sql = "select * from users where email=? and password=?";
            ps = con.prepareStatement(Sql);
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                rd = req.getRequestDispatcher("account.jsp");
            } else {
                req.setAttribute("status", "error");
                rd = req.getRequestDispatcher("login.jsp");
            }

            // for moderator login
            Sql = "select * from users where email=? and password=? and moderator='yes'";
            ps = con.prepareStatement(Sql);
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                rd = req.getRequestDispatcher("moderator");
            }

            rd.forward(req, res);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}