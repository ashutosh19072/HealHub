
package controller;

import dao.StockDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateStockServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String newQuantity = request.getParameter("newQuantity");
        String stockid = request.getParameter("stockid");
        
        System.out.println(newQuantity);
        System.out.println(stockid);
        
        boolean isUpdate = StockDAO.updateMedicineStock(newQuantity, stockid);
        
        if(isUpdate)
        {
            response.sendRedirect("pharmacyDashboard.jsp");
        }
        else
        {
            response.sendRedirect("failed.jsp");
        }
    }
}
