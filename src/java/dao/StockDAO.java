
package dao;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Stock;

public class StockDAO 
{
    public static List<Stock> getStock(String pharmacy_id)
    {
       List<Stock> medicineStock = new ArrayList<>();
       
       try
       {
           Statement st = DBConnector.getStatement();
           
           String query = "SELECT m.name,m.company,m.description,s.stock_id,s.quantity FROM stock s JOIN pharmacy p ON s.pharmacy_id = p.pharmacy_id JOIN medicine m ON s.medicine_id = m.medicine_id WHERE s.pharmacy_id = '"+pharmacy_id+"' ";
           
           ResultSet rs = st.executeQuery(query);
           
           while(rs.next())
           {
               Stock s = new Stock();
               s.setMedicineName(rs.getString(1));
               s.setCompany(rs.getString(2));
               s.setDescription(rs.getString(3));
               s.setStockId(rs.getInt(4));
               s.setQuantity(rs.getInt(5));
               medicineStock.add(s);
           }
       }
       catch(SQLException e)
       {
           System.out.println(e);
       }
       return medicineStock;
    }
    
//------------------------------------------------------------------------------
    
    public static boolean medicineStockRemove(String stockid)
    {   
        int i=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "delete from stock where stock_id='"+stockid+"' ";
            
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
    
    public static boolean updateMedicineStock(String newQuantity,String stockid)
    {
        int i=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "update stock set quantity='"+newQuantity+"' where stock_id='"+stockid+"' ";
            
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
    
}
