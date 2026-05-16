
package controller;

import dao.PharmacyDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Pharmacy;


public class SearchPharmacyServlet extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        double userLat = Double.parseDouble(request.getParameter("lat"));
        double userLng = Double.parseDouble(request.getParameter("lng"));
        
        
        List<Pharmacy> list = PharmacyDAO.getNearbyPharmacies(userLat, userLng);
        
        HttpSession session = request.getSession();
        session.setAttribute("pharmacyList", list);

        response.sendRedirect("userDashboard.jsp");
    }

    
    

    
}
