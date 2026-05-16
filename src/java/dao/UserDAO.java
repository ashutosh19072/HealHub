
package dao;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.User;


public class UserDAO 
{
        
      public boolean isRegister(User u)
      {
          int i =0;
          
          String username = u.getUsername();
          String email = u.getEmail();
          String password = u.getPassword();
          
          try
          {
              Statement st = DBConnector.getStatement();
          
              String query = "insert into users(username,email,password) values('"+username+"','"+email+"','"+password+"')";
          
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
      
//-------------------------------------------------------------------------------      
      
      public boolean isLogin(User u)
      {
          String email = u.getEmail();
          String password = u.getPassword();
          String tablePassword="";
          
          try
          {
              Statement st = DBConnector.getStatement();
              
              String query = "select password from users where email='"+email+"'";
              
              ResultSet rs = st.executeQuery(query);
              
              if(rs.next())
              {
                  tablePassword = rs.getString(1);
              }
          }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
          if(email!=null && password!=null && password.equals(tablePassword))
          {
              return true;
          }
          
          return false;
      }
      
//-------------------------------------------------------------------------------
        
      public static User getData(String email)
      { 
          User u = new User();
          
          try
          {
              Statement st = DBConnector.getStatement();
              
              String query = "select * from users where email='"+email+"'";
              
              ResultSet rs = st.executeQuery(query);
              
              if(rs.next())
              {
                  u.setUserId(Integer.parseInt(rs.getString("user_id")));
                  u.setUsername(rs.getString("username"));
                  u.setEmail(rs.getString("email"));
                  u.setPassword(rs.getString("password"));
              }
          }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
          return u;
      }
      
//-------------------------------------------------------------------------------
      
      public static List<User> getAllUsers()
      {
          List<User> allUsers = new ArrayList<>();
          
          try
          {
              Statement st = DBConnector.getStatement();
              
              String query = "select user_id,username,email from users where status='active'";
              
              ResultSet rs = st.executeQuery(query);
              
              while(rs.next())
              {
                  User u = new User();
                  u.setUserId(rs.getInt(1));
                  u.setUsername(rs.getString(2));
                  u.setEmail(rs.getString(3));
                  allUsers.add(u);
              }
          }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
          
          return allUsers;
      }
      
//------------------------------------------------------------------------------
      
      public static boolean updateUser(User u)
      { 
          int i=0;  
          
          try
          {
              Statement st = DBConnector.getStatement();
              
              String query = "update users set username='"+u.getUsername()+"',email='"+u.getEmail()+"' where user_id='"+u.getUserId()+"' ";
              
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
      
//------------------------------------------------------------------------------
      
      public static boolean passwordUpdate(String userid,String newpassword)
      { 
          int i=0;
          
          try
          {
              Statement st = DBConnector.getStatement();
              
              String query = "update users set password='"+newpassword+"' where user_id='"+userid+"' ";
              
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
      
//------------------------------------------------------------------------------
      
      public static boolean passwordUpdateByEmail(String email,String newpassword)
      { 
          int i=0;
          
          try
          {
              Statement st = DBConnector.getStatement();
              
              String query = "update users set password='"+newpassword+"' where email='"+email+"' ";
              
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
      
 
//------------------------------------------------------------------------------      
      
      public static int getUserCount()
    {       
        int userCount=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "select count(user_id) from users";
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next())
            {
                userCount = rs.getInt(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return userCount;
    }
      
//------------------------------------------------------------------------------
      
    public static boolean deleteUserbyID(String userid)
    {   
        int i=0;
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "update users set status='inactive' where user_id='"+userid+"'";
            
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
    
    public static boolean isEmailExists(String email)
    {
        
        try
        {
            Statement st = DBConnector.getStatement();
            
            String query = "select * from users where email='"+email+"' ";
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next())
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





