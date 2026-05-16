
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateUserPasswordServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String userid = request.getParameter("userid");
        String userpassword = request.getParameter("userpassword");
        String currentpassword = request.getParameter("currentPassword");
        String newpassword = request.getParameter("newPassword");
        String confirmnewpassword = request.getParameter("confirmNewPassword");
        
        if(userpassword.equals(currentpassword) && newpassword.equals(confirmnewpassword))
        {
            boolean passwordUpdate = UserDAO.passwordUpdate(userid,newpassword);
            
            if(passwordUpdate)
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
