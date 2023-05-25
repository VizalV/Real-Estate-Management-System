import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

public class searchbox extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // for location wise search
        String search_box = req.getParameter("search_box");
        String whereClause = "";
        String Sql = "";
        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            if (search_box.equals("") || search_box == null) {
                System.out.println(whereClause);
                Sql = "SELECT * FROM sellproperty WHERE status='accepted' " + whereClause;
            } else {

                Sql = "SELECT * FROM sellproperty where status='accepted' AND location like '%" + search_box + "%' "
                        + whereClause;
            }

            // execute the search
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery(Sql);

            String data = "";
            int ncols = 24;
            while (rs.next()) {

                for (int i = 1; i < ncols + 1; i++) {
                    data += rs.getString(i) + "~";
                }
                data += "\n";
            }

            RequestDispatcher rd = req.getRequestDispatcher("properties.jsp");

            req.setAttribute("data_concat", data);
            rd.forward(req, res);
            con.close();

        } catch (Exception e) {
            System.out.println(e);
            PrintWriter out = res.getWriter();
            out.println(e + "\n" + Sql);
        }
    }
}