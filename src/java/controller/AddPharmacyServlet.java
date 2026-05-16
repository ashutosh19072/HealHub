
package controller;

import dao.PharmacyDAO;
import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pharmacy;
import model.User;


public class AddPharmacyServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String pname = request.getParameter("pname");
        String oname = request.getParameter("oname");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        double lat = Double.parseDouble(request.getParameter("latitude"));
        double lng = Double.parseDouble(request.getParameter("longitude"));
        
        String email = request.getParameter("email");
        
        UserDAO ud = new UserDAO();
        User u = ud.getData(email);
        
        Pharmacy p = new Pharmacy();
        p.setOwnerId(u.getUserId());
        p.setPname(pname);
        p.setOname(oname);
        p.setAddress(address);
        p.setContact(contact);
        p.setLatitude(lat);
        p.setLongitude(lng);
        
        PharmacyDAO pd = new PharmacyDAO();
        boolean isRegister = pd.isRegister(p);
        
        if(isRegister)
        {
            response.sendRedirect("UserManagePharmacy.jsp");
        }
        else
        {
           response.sendRedirect("failed.jsp");
        }
    }
}
