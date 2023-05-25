import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class sell extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String looking = req.getParameter("looking");
        String type = req.getParameter("type");

        int door = Integer.parseInt(req.getParameter("door"));
        String address = req.getParameter("address");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        int pincode = Integer.parseInt(req.getParameter("pincode"));
        String location = city + state + pincode;

        int bedrooms = -1;
        String furnish = "";
        String availability = "";
        int length = -1;
        int breadth = -1;
        int total_floors = -1;

        if (type.equals("1") || type.equals("3")) { // individual house

            bedrooms = Integer.parseInt(req.getParameter("bed"));
            furnish = req.getParameter("furnished");
            availability = req.getParameter("availability");
        } else if (type.equals("2")) { // Apartment
            bedrooms = Integer.parseInt(req.getParameter("bed"));
            if (bedrooms > 3) {
                bedrooms = Integer.parseInt(req.getParameter("beds"));
            }
            // total_floors = Integer.parseInt(req.getParameter("propertyonfloor"));`
            availability = req.getParameter("availability");
        } else if (type.equals("4")) { // plot
            length = Integer.parseInt(req.getParameter("length"));
            breadth = Integer.parseInt(req.getParameter("breadth"));
        }

        int floor = Integer.parseInt(req.getParameter("floor"));
        int area = Integer.parseInt(req.getParameter("area"));
        String expected_price = req.getParameter("expectedprice");
        String desc = req.getParameter("description");
        String id = session.getAttribute("email").toString();
        String drivelink = req.getParameter("drivelink");

        int countid = 0;
        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            String Sql = "select max(countid) as max from sellproperty where id=?";
            PreparedStatement stmt = con.prepareStatement(Sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                countid = Integer.parseInt(rs.getString("max"));
            }
        } catch (Exception e) {
            PrintWriter out = res.getWriter();
            out.println(e);
        }

        countid++;

        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            String Sql = "insert into sellproperty values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(Sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, looking);
            ps.setString(4, type);
            ps.setInt(5, door);
            ps.setString(6, address);
            ps.setString(7, city);
            ps.setString(8, state);
            ps.setInt(9, pincode);
            ps.setInt(10, bedrooms);
            ps.setInt(11, area);
            ps.setString(12, furnish);
            ps.setInt(13, total_floors);
            ps.setInt(14, floor);
            ps.setInt(15, length);
            ps.setInt(16, breadth);
            ps.setString(17, availability);
            ps.setString(18, expected_price);
            ps.setString(19, desc);
            ps.setString(20, "Pending");
            ps.setString(21, id);
            ps.setString(22, location);
            ps.setString(23, countid + "");
            ps.setString(24, drivelink);

            int count = ps.executeUpdate();
            RequestDispatcher rd = req.getRequestDispatcher("choice.jsp");
            if (count > 0) {
                req.setAttribute("new_property", "success");
            } else {
                req.setAttribute("new_property", "failed");
            }
            rd.forward(req, res);
            con.close();

        } catch (Exception e) {
            PrintWriter out = res.getWriter();
            // out.println(e + "\n" + id + "\n" + name + "\n" + phone + "\n" + looking +
            // "\n"
            // + type + "\n" + door + "\n"
            // + address
            // + "\n" + city + "\n" + state + "\n" + pincode + "\n" + bedrooms + "\n" + area
            // + "\n" + furnish
            // + "\n" +
            // availability + "\n" + length + "\n" + breadth + "\n" + total_floors + "\n" +
            // floor + "\n" + area
            // + "\n" + expected_price + "\n" + ppsqft + "\n" + pneg + "\n" + desc);
            out.println(countid);
            out.println("Database error!");
        }
    }
}