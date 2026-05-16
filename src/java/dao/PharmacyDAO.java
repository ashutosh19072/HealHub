
package dao;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Pharmacy;


public class PharmacyDAO 
{

        public boolean isRegister(Pharmacy p)
        {
            int i = 0;
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query="insert into pharmacy(owner_id,pname,oname,address,contact,latitude,longitude) values('"+p.getOwnerId()+"','"+p.getPname()+"','"+p.getOname()+"','"+p.getAddress()+"','"+p.getContact()+"','"+p.getLatitude()+"','"+p.getLongitude()+"')";
                
                i = st.executeUpdate(query);
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            if(i>0)
            {
                return true;
            }
        
        return false;    
        }
        
//------------------------------------------------------------------------------------------   
        
        public static List<Pharmacy> getPendingPharmacy()
        {
            List<Pharmacy> pharmacy = new ArrayList<>();
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query = "select pname,oname,address,contact,pharmacy_id from pharmacy where status='PENDING'";
                
                ResultSet rs = st.executeQuery(query);
                
                while(rs.next())
                {
                    Pharmacy p = new Pharmacy();
                    p.setPname(rs.getString(1));
                    p.setOname(rs.getString(2));
                    p.setAddress(rs.getString(3));
                    p.setContact(rs.getString(4));
                    p.setPharmacyId(rs.getInt(5));
                    pharmacy.add(p);
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            return pharmacy;
        }
        
//------------------------------------------------------------------------------------------        
        
        public boolean approvePharmacy(String p_id,String action)
        {   
            int i=0;
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query = "update pharmacy set status='"+action+"' where pharmacy_id='"+p_id+"'";
                
                i = st.executeUpdate(query);
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            if(i>0)
            {
                return true;
            }
            
            return false;
        }
        
//------------------------------------------------------------------------------------------        
        
        public static List<Pharmacy> getApprovedPharmacy()
        {
            List<Pharmacy> approvedPharmacy = new ArrayList<>();
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query = "select pname,oname,address,contact,pharmacy_id from pharmacy where status='APPROVED'";
                
                ResultSet rs = st.executeQuery(query);
                
                while(rs.next())
                {
                    Pharmacy p = new Pharmacy();
                    p.setPname(rs.getString(1));
                    p.setOname(rs.getString(2));
                    p.setAddress(rs.getString(3));
                    p.setContact(rs.getString(4));
                    p.setPharmacyId(rs.getInt(5));
                    approvedPharmacy.add(p);
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            return approvedPharmacy;
        }
        
//------------------------------------------------------------------------------------------
        
        public static List<Pharmacy> getApprovedPharmacy(String email)
        {
            List<Pharmacy> approvedPharmacy = new ArrayList<>();
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query = "select pname,oname,address,contact,pharmacy_id from pharmacy where status='APPROVED' AND owner_id=(select user_id from users where email='"+email+"')";
                
                ResultSet rs = st.executeQuery(query);
                
                while(rs.next())
                {
                    Pharmacy p = new Pharmacy();
                    p.setPname(rs.getString(1));
                    p.setOname(rs.getString(2));
                    p.setAddress(rs.getString(3));
                    p.setContact(rs.getString(4));
                    p.setPharmacyId(rs.getInt(5));
                    approvedPharmacy.add(p);
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            return approvedPharmacy;
        }
        
//------------------------------------------------------------------------------------------
        
        public static Pharmacy getPharmacyData(String pharmacy_id)
        {
            Pharmacy p = new Pharmacy();
            
            try
            {
                Statement st = DBConnector.getStatement();
            
                String query = "select * from pharmacy where pharmacy_id='"+pharmacy_id+"'";
                
                ResultSet rs = st.executeQuery(query);
                
                if(rs.next())
                {
                    p.setPharmacyId(rs.getInt(1));
                    p.setOwnerId(rs.getInt(2));
                    p.setPname(rs.getString(3));
                    p.setOname(rs.getString(4));
                    p.setAddress(rs.getString(5));
                    p.setContact(rs.getString(5));
                    return p;
                }
                
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            return null;
            
        }
        
//------------------------------------------------------------------------------
        
        public static int getApprovedPharmacyCount()
    {       
        int pharmacyCount=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "select count(pharmacy_id) from pharmacy where status='APPROVED'";
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next())
            {
                pharmacyCount = rs.getInt(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return pharmacyCount;
    }
        
//------------------------------------------------------------------------------
    
    public static int getPendingPharmacyCount()
    {       
        int pharmacyCount=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "select count(pharmacy_id) from pharmacy where status='PENDING'";
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next())
            {
                pharmacyCount = rs.getInt(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return pharmacyCount;
    }    
        
//------------------------------------------------------------------------------
    
    public static List<Pharmacy> getPendingPharmacy(String email)
        {
            List<Pharmacy> pharmacy = new ArrayList<>();
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query = "select pname,oname,address,contact,pharmacy_id from pharmacy where status='PENDING' AND owner_id=(select user_id from users where email='"+email+"')";
                
                ResultSet rs = st.executeQuery(query);
                
                while(rs.next())
                {
                    Pharmacy p = new Pharmacy();
                    p.setPname(rs.getString(1));
                    p.setOname(rs.getString(2));
                    p.setAddress(rs.getString(3));
                    p.setContact(rs.getString(4));
                    p.setPharmacyId(rs.getInt(5));
                    pharmacy.add(p);
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            return pharmacy;
        }
    
//------------------------------------------------------------------------------
    
        public static List<Pharmacy> getNearbyPharmacies(double userLat, double userLng) {

        List<Pharmacy> list = new ArrayList<>();

        try 
        {
            
            Statement st = DBConnector.getStatement();

           String query = "SELECT *, (6371 * acos(cos(radians('"+userLat+"')) * cos(radians(latitude)) * cos(radians(longitude) - radians('"+userLng+"')) + sin(radians('"+userLat+"')) * sin(radians(latitude)))) AS distance FROM pharmacy HAVING distance < 10 ORDER BY distance";

        

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) 
            {
                
                Pharmacy p = new Pharmacy();

                p.setPharmacyId(rs.getInt("pharmacy_id"));
                p.setPname(rs.getString("pname"));
                p.setAddress(rs.getString("address"));
                p.setContact(rs.getString("contact"));
                p.setDistance(rs.getDouble("distance"));
                p.setLatitude(rs.getDouble("latitude"));
                p.setLongitude(rs.getDouble("longitude"));

                list.add(p);
            }

        } 
        catch (SQLException e) 
        {
            System.out.println(e);
        }
        
           

    return list;
}
        
//------------------------------------------------------------------------------
        
        public static boolean cancelPharmacyApproval(int pharmacyid)
        {   
            int i=0;
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query = "update pharmacy set status='PENDING' where pharmacy_id='"+pharmacyid+"' ";
                
                i = st.executeUpdate(query);
                
                if(i>0)
                    return true;
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            return false;
            
        }
        
//------------------------------------------------------------------------------
    
//        public static List<Pharmacy> getUserPharmacy(String email)
//        {   
//            
//            List<Pharmacy> userPharmacy = new ArrayList<>();
//            
//            try
//            {   
//                Statement st = DBConnector.getStatement();
//                
//                String query = "select * from pharmacy where owner_id=(select user_id from users where email='"+email+"')";
//                
//                ResultSet rs = st.executeQuery(query);
//                
//                
//                while(rs.next())
//                {
//                    Pharmacy p = new Pharmacy();
//                    p.setPname(rs.getString(1));
//                    p.setOname(rs.getString(2));
//                    p.setAddress(rs.getString(3));
//                    p.setContact(rs.getString(4));
//                    userPharmacy.add(p);
//                }
//            }
//            catch(SQLException e)
//            {
//                System.out.println(e);
//            }
//                
//            return userPharmacy;
//        }
}


  
    
    
