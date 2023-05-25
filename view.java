import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class view extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void sendData(HttpServletRequest req, HttpServletResponse res, Connection con, String id)
            throws ServletException, IOException {

        try {

            String data = "";
            String Sql = "select * from sellproperty where id=?";
            PreparedStatement ps = con.prepareStatement(Sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            int coln = 24;
            while (rs.next()) {

                for (int i = 1; i < coln + 1; i++) {
                    data += rs.getString(i) + "~";
                }
                data += "\n";
            }

            res.setContentType("text/plain");
            PrintWriter out = res.getWriter();
            out.write(data);

        } catch (Exception e) {
            PrintWriter out = res.getWriter();
            out.println(e);
        }

    }

    public void updatePage(HttpServletRequest req, HttpServletResponse res, Connection con, String action, String rowid,
            String id)
            throws ServletException, IOException {

        int count = Integer.parseInt(rowid); // the row number to retrieve
        String Sql = "SELECT * FROM sellproperty where id=?";
        PreparedStatement ps;
        String data = "";
        String lookingto = req.getParameter("lookingto");
        String price = req.getParameter("price");
        int eprice = 0;
        if (price != null) {
            eprice = Integer.parseInt(price);
        }
        try {
            ps = con.prepareStatement(Sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            String cid = null;
            String email = id;
            if (rs.absolute(count)) {
                cid = rs.getString("countid");
            }
            ps = null;
            if (action.equals("update") && cid != null) {
                Sql = "UPDATE sellproperty SET looking_to=?, expected_price=? WHERE countid=? AND id=?";
                ps = con.prepareStatement(Sql);
                ps.setString(1, lookingto);
                ps.setInt(2, eprice);
                ps.setString(3, cid);
                ps.setString(4, email);
                ps.executeUpdate();

            } else if (action.equals("delete") && cid != null) {
                Sql = "DELETE from sellproperty WHERE countid=? AND id=?";
                ps = con.prepareStatement(Sql);
                ps.setString(1, cid);
                ps.setString(2, email);
                ps.executeUpdate();
            }
            ps = null;
            Sql = "SELECT * FROM sellproperty where id=?";
            ps = con.prepareStatement(Sql);
            ps.setString(1, id);
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
            PrintWriter out = res.getWriter();
            out.println(e);
        }

    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String id = session.getAttribute("email").toString();
        String action = req.getParameter("action");
        String rowid = req.getParameter("id");

        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            if (action == null && rowid == null) {
                sendData(req, res, con, id);
            } else {
                updatePage(req, res, con, action, rowid, id);
            }
            con.close();
        } catch (Exception e) {
            PrintWriter out = res.getWriter();
            out.println(e);
        }
    }
}