package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;


public class UpdateUserServlet extends HttpServlet 
{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        
        int userid = Integer.parseInt(request.getParameter("userid"));
 
        
        if(!name.equals("") && !email.equals(""))
        {
            User u = new User();
            u.setEmail(email);
            u.setUsername(name);
            u.setUserId(userid);
        
            boolean isUpdate = UserDAO.updateUser(u);
        
            if(isUpdate)
            {
                response.sendRedirect("success.jsp");
            }
            else
            {
                response.sendRedirect("failed.jsp");
            }
        }
        else
        {
            response.sendRedirect("failed.jsp");
        }
        
        
        
    }

    
}
