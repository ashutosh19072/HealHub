
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteUserServlet extends HttpServlet 
{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String userid = request.getParameter("userid");
        
        boolean isDelete = UserDAO.deleteUserbyID(userid);
        
        if(isDelete)
        {
            response.sendRedirect("manageUsers.jsp");
        }
        else
        {
            response.sendRedirect("failed.jsp");
        }
    }    
}
