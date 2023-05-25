import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class register extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("username");
        String password = req.getParameter("password");
        long phone = Long.parseLong(req.getParameter("phone"));

        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            String Sql = "insert into users values(?, ?, ?, ?, 'no')"; // index 5 is moderator login = (yes/no) by default no
            PreparedStatement ps = con.prepareStatement(Sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setLong(4, phone);

            int count = ps.executeUpdate();
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");

            if(count > 0)
                req.setAttribute("status", "success");
            else
                req.setAttribute("status", "error");
            rd.forward(req, res);
            con.close();
        } catch (Exception e) {
            System.out.println(e);

            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            req.setAttribute("status", "already");
            rd.forward(req, res);
        }
    }
}