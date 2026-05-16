
package controller;

import dao.StockDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class medicineStockRemoveServlet extends HttpServlet 
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
            
        String stock_id = request.getParameter("stockid");
        
        System.out.println(stock_id);
        
        boolean isDelete = StockDAO.medicineStockRemove(stock_id);
        
        if(isDelete)
        {
            response.sendRedirect("pharmacyDashboard.jsp");
        }
        else
        {
            response.sendRedirect("failed.jsp");
        }
    }
}
