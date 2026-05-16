
package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;


public class RegisterServlet extends HttpServlet 
{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        UserDAO user = new UserDAO();
        
        if(user.isEmailExists(email))
        {
            request.getSession().setAttribute("error", "Registration Failed : Email Already Registered");
            
            response.sendRedirect("register.jsp");
            return;
        }
        else if(!password.equals((confirmPassword)))
        {
            request.getSession().setAttribute("error", "Registration Failed : Passwords do not Match");
            
            response.sendRedirect("register.jsp");
            return;
        }
        else{
            
        User u = new User();
        u.setUsername(username);
        u.setEmail(email);
        u.setPassword(password);
        
        boolean isRegister = user.isRegister(u);
        
        if(isRegister)
        {
                HttpSession session = request.getSession(true);
                session.setAttribute("email",email);
                response.sendRedirect("userDashboard.jsp");
        }
        else
        {
            response.sendRedirect("register.jsp");
        }
        
      }  
    }

    
    

}
