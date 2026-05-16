package dao;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Medicine;


public class MedicineDAO 
{
    public static List<Medicine> getAllMedicineName()
    {   
        List<Medicine> allMedicineName = new ArrayList<>();
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "select * from medicine";
            
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
            {
                Medicine m = new Medicine();
                m.setMedicineId(rs.getInt(1));
                m.setName(rs.getString(2));
                m.setCompany(rs.getString(3));
                m.setDescription(rs.getString(4));
                allMedicineName.add(m);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return allMedicineName;
    }
    
//------------------------------------------------------------------------------

    public static boolean addMedicine(String medicineName, int quantity, String pharmacy_id)
    {   
        int i=0;
            
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "insert into stock(pharmacy_id,medicine_id,quantity) values('"+pharmacy_id+"',(select medicine_id from medicine where name='"+medicineName+"' ),'"+quantity+"' )";
            
            i = st.executeUpdate(query);
            
            if(i>0)
            {
                return true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return false;
    }
    
//------------------------------------------------------------------------------
    
    public static int getMedicineCount()
    {       
        int medicineCount=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "select count(name) from medicine";
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next())
            {
                medicineCount = rs.getInt(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return medicineCount;
    }
    
//------------------------------------------------------------------------------
}
