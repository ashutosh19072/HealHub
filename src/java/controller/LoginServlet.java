
package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
       
        if(email!=null && password!=null && email.equalsIgnoreCase("admin@gmail.com") && password.equals("admin"))
        {   
            HttpSession session = request.getSession(true);
            session.setAttribute("email",email);
            response.sendRedirect("adminDashboard.jsp");
        }
        else
        {
            User u = new User();
            u.setEmail(email);
            u.setPassword(password);
        
            UserDAO ud = new UserDAO();
            boolean isLogin = ud.isLogin(u);
        
            if(isLogin)
            {   
                HttpSession session = request.getSession(true);
                session.setAttribute("email",email);
                response.sendRedirect("userDashboard.jsp");
            }
            else
            {   HttpSession session = request.getSession(true);
                session.setAttribute("error","invalidlogin");
                response.sendRedirect("login.jsp");
            } 
        }
        
        
    }
}
