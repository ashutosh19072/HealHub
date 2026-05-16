
package controller;

import dao.MedicineDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddMedicineServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String medicineName = request.getParameter("medicine");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String pharmacy_id = request.getParameter("pharmacy_id");
        
        System.out.println("Medicine name : "+medicineName);
        
        if(quantity>0)
        {
            boolean isAdded = MedicineDAO.addMedicine(medicineName,quantity,pharmacy_id);
            
            if(isAdded)
            {
                response.sendRedirect("pharmacyDashboard.jsp");
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
