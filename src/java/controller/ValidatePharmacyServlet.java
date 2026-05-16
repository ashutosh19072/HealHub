
package controller;

import dao.PharmacyDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ValidatePharmacyServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String p_id = request.getParameter("p_id");
        String action = request.getParameter("action");
        
        PharmacyDAO pd = new PharmacyDAO();
        boolean result = pd.approvePharmacy(p_id,action);
        
        if(result)
        {
            response.sendRedirect("adminDashboard.jsp");
        }
        else
        {
            response.sendRedirect("success.jsp");
        }
    }
}
