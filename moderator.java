import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class moderator extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void redirectPage(HttpServletRequest req, HttpServletResponse res, Connection con)
            throws ServletException, IOException {
        String Sql = "SELECT * FROM sellproperty where status='pending'";
        Statement stmt;
        try {
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stmt.executeQuery(Sql);

            String data = "";
            while (rs.next()) {

                for (int i = 1; i < 24; i++) {
                    data += rs.getString(i) + "~";
                }
                data += "\n";
            }

            RequestDispatcher rd = req.getRequestDispatcher("moderator.jsp");

            req.setAttribute("data_mod", data);
            rd.forward(req, res);

        } catch (Exception e) {
            System.out.println(e);
            PrintWriter out = res.getWriter();
            out.println(e);
        }
    }

    public void updatePage(HttpServletRequest req, HttpServletResponse res, Connection con, String action, String id)
            throws ServletException, IOException {

        int count = Integer.parseInt(id); // the row number to retrieve
        String Sql = "SELECT * FROM sellproperty where status='pending'";
        PreparedStatement ps;
        String data = "";
        try {
            ps = con.prepareStatement(Sql);
            ResultSet rs = ps.executeQuery();

            String cid = null;
            String email = null;
            if (rs.absolute(count)) {
                cid = rs.getString("countid");
                email = rs.getString("id");
            }
            ps = null;
            if (action.equals("accept") && cid != null && email != null) {
                Sql = "UPDATE sellproperty SET status=? WHERE countid=? AND id=?";
                ps = con.prepareStatement(Sql);
                ps.setString(1, "accepted");
                ps.setString(2, cid);
                ps.setString(3, email);
                ps.executeUpdate();

            } else if (action.equals("reject") && cid != null && email != null) {
                Sql = "DELETE from sellproperty WHERE countid=? AND id=?";
                ps = con.prepareStatement(Sql);
                ps.setString(1, cid);
                ps.setString(2, email);
                ps.executeUpdate();
            }
            ps = null;
            Sql = "SELECT * FROM sellproperty where status='pending'";
            ps = con.prepareStatement(Sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                for (int i = 1; i < 24; i++) {
                    data += rs.getString(i) + "~";
                }
                data += "\n";
            }

            res.setContentType("text/plain");
            PrintWriter out = res.getWriter();
            out.write(data);

        } catch (Exception e) {
            // System.out.println(e);
            PrintWriter out = res.getWriter();
            out.println(e);
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String action = req.getParameter("action");
        String id = req.getParameter("id");

        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            if (action == null && id == null) {
                redirectPage(req, res, con);
            } else {
                updatePage(req, res, con, action, id);
            }

            con.close();

        } catch (Exception e) {
            PrintWriter out = res.getWriter();
            out.println(e);
        }
    }
}