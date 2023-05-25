import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class setsession extends HttpServlet {

    static public String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static public String DB_URL = "jdbc:mysql://localhost:3306/rems?useSSL=false";

    static public String USER = "root";
    static public String PASSWORD = "1102";

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();
        if(session.getAttribute("name") == null){
            session.setAttribute("login", "no");
        }else{
           session.setAttribute("login", "yes");
        }
        RequestDispatcher rd = req.getRequestDispatcher("aboutus.jsp");
        rd.forward(req, res);
    }
}