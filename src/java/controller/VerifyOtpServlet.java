
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VerifyOtpServlet extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int enteredOtp = Integer.parseInt(request.getParameter("otp"));
        
        HttpSession mySession = request.getSession();
        String email = (String)mySession.getAttribute("email4forget");
        int otp   = (int)mySession.getAttribute("otp");
        
        if(enteredOtp==otp && UserDAO.isEmailExists(email))
        {
            response.sendRedirect("setNewPassword.jsp");
        }
        else
        {
            response.sendRedirect("enterOtp.jsp?error=invalid");
        }
    }

    
}
