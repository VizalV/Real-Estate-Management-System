import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

public class properties extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // for location wise search
        String search_box = req.getParameter("search_box");
        // filters
        String area = req.getParameter("areaText");

        String priceRange = req.getParameter("price");
        String[] priceArr = null;
        if (priceRange != null)
            priceArr = priceRange.split("-");
        String minPrice = null;
        String maxPrice = null;
        if (priceArr.length > 1) {
            minPrice = priceArr[0];
            maxPrice = priceArr[1];
        }

        // 2d array of strings
        String[] lookingto = req.getParameterValues("lookingto");
        String[] type = req.getParameterValues("ptype");
        String[] bedrooms = req.getParameterValues("bedroom");
        String[] construction = req.getParameterValues("construction");
        String[] furnishing = req.getParameterValues("furnishing");

        StringBuilder whereClause = new StringBuilder();

        if (area != null) {
            if (!area.equals(""))
                whereClause.append(" AND plot_area <= " + area);
        }
        if (minPrice != null && maxPrice != null) {
            whereClause.append(" AND expected_price between " + minPrice + " AND " +
                    maxPrice);
        }

        // multiple values for search values and appending them to where clause
        if (lookingto != null && lookingto.length > 0) {
            whereClause.append(" AND looking_to IN (");
            for (String value : lookingto) {
                if (value.equals("Buy"))
                    value = "Sell";
                whereClause.append("'" + value + "',");
            }
            whereClause.setLength(whereClause.length() - 1); // Remove the last comma
            whereClause.append(")");
        }
        int a = 1;
        if (type != null && type.length > 0) {
            whereClause.append(" AND property_type IN (");
            for (String value : type) {
                if (value.equals("Individual House"))
                    a = 1;
                else if (value.equals("Apartments"))
                    a = 2;
                else if (value.equals("Villa"))
                    a = 3;
                else if (value.equals("Plot"))
                    a = 4;
                whereClause.append("" + a + ",");
            }
            whereClause.setLength(whereClause.length() - 1);
            whereClause.append(")");
        }
        if (bedrooms != null && bedrooms.length > 0) {
            whereClause.append(" AND bedrooms IN (");
            for (String value : bedrooms) {
                String val = "";
                val = value.substring(0, 1);
                whereClause.append(val + ",");
            }
            whereClause.setLength(whereClause.length() - 1);
            whereClause.append(")");
        }
        if (construction != null && construction.length > 0) {
            whereClause.append(" AND availability IN (");
            for (String value : construction) {
                whereClause.append("'" + value + "',");
            }
            whereClause.setLength(whereClause.length() - 1);
            whereClause.append(")");
        }
        if (furnishing != null && furnishing.length > 0) {
            whereClause.append(" AND furnishing IN (");
            for (String value : furnishing) {
                whereClause.append("'" + value + "',");
            }
            whereClause.setLength(whereClause.length() - 1);
            whereClause.append(")");
        }

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