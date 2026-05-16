
package controller;

import dao.SearchDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SearchResult;

public class SearchMedicineServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String medicine = request.getParameter("medicine");
        String city = request.getParameter("location");

        SearchDAO dao = new SearchDAO();
        List<SearchResult> list = dao.searchMedicine(medicine, city);

        request.setAttribute("results", list);

        RequestDispatcher rd = request.getRequestDispatcher("userDashboard.jsp");
        rd.forward(request, response);
    }
}
