package controller;

import dao.PharmacyDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CancelPharmacyApprovalServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("index.jsp");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int pharmacyid = Integer.parseInt(request.getParameter("pid"));
        
        boolean b = PharmacyDAO.cancelPharmacyApproval(pharmacyid);
        
        if(b)
        {
            response.sendRedirect("managePharmacy.jsp");
        }
        else
        {
            response.sendRedirect("managePharmacy.jsp");
        }
    }
}
