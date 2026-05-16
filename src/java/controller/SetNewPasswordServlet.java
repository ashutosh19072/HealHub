
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SetNewPasswordServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.sendRedirect("index.jsp");
        
    }
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String password = request.getParameter("new-password");
        
        HttpSession mySession = request.getSession();
        
        String email = (String)mySession.getAttribute("email4forget");
        
        boolean isForget = UserDAO.passwordUpdateByEmail(email, password);
        
        if(isForget)
        {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
            
        }
        else
        {
            response.sendRedirect("failed.jsp");
        }
           
    }

   
}
