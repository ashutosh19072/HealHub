
package dao;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.User;
import org.mindrot.jbcrypt.BCrypt;


public class UserDAO 
{
        
      public boolean isRegister(User u)
      {
          int i =0;
          
          String username = u.getUsername();
          String email = u.getEmail();
          String password = u.getPassword();
          
          String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
          
          try
          { 
              Connection con = DBConnector.getConnection();
              
              String query = "INSERT INTO users(username,email,password) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, hashedPassword);

            i = ps.executeUpdate();
              
             
          }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
          return i>0;
          
      }
      
//-------------------------------------------------------------------------------      
      
      public boolean isLogin(User u)
      {
          String email = u.getEmail();
          String password = u.getPassword();
          //String tablePassword="";
          
          try
          { 
              Connection con = DBConnector.getConnection();
              
              String query = "select password from users where email=?";
              
              PreparedStatement ps = con.prepareStatement(query);
               
              ps.setString(1, email);
              
              ResultSet rs = ps.executeQuery();
              
              if(rs.next())
              {
                  String hashPassword = rs.getString("password");
                  
                  return BCrypt.checkpw(password, hashPassword);
              }
          }
          catch(SQLException e)
          {
              System.out.println(e);
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
              Connection con = DBConnector.getConnection();
              
              //Statement st = DBConnector.getStatement();
              
              String hashedPassword = BCrypt.hashpw(newpassword, BCrypt.gensalt(12));
              
              String query = "update users set password=? where user_id=? ";
              
              PreparedStatement ps = con.prepareStatement(query);
              
              ps.setString(1, hashedPassword);
              ps.setString(2, userid);
              
              i = ps.executeUpdate();
          }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
          return i>0;
      }
      
//------------------------------------------------------------------------------
      
      public static boolean passwordUpdateByEmail(String email,String newpassword)
      { 
          int i=0;
          
          try
          {
              Connection con = DBConnector.getConnection();
              
              //Statement st = DBConnector.getStatement();
              
              String hashedPassword = BCrypt.hashpw(newpassword, BCrypt.gensalt(12));
              
              String query = "update users set password=? where email=? ";
              
              PreparedStatement ps = con.prepareStatement(query);
              
              ps.setString(1, hashedPassword);
              ps.setString(2, email);
              
              i = ps.executeUpdate();
          }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
          return i>0;
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
    
    
    public static boolean isUserActive(String userid)
    {
        try
        {   
            Connection con = DBConnector.getConnection();
            
            //Statement st = DBConnector.getStatement();
            
            String query = "select status from users where user_id=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, userid);
            
            ResultSet rs = ps.executeQuery();
            
            String s;
            
            if(rs.next())
            {
                s = rs.getString(1);
                
                if(s.equals("active"))
                {
                    return true;
                }
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }
//------------------------------------------------------------------------------
    
    public static void sendMail(String email,String username)
    {
                        String to = email;
                        
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
                        
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
                        {
				protected PasswordAuthentication getPasswordAuthentication() 
                                {
					return new PasswordAuthentication("support.healhubltd@gmail.com", "your_Email_Key");// Put your email
				}
			});
			// compose message
			try 
                        {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Welcome to HealHub - Registration Successful");
                                message.setText(
    "Dear " + username + ",\n\n" +

    "Welcome to HealHub!\n\n" +

    "Your account has been successfully created. We are delighted to have you as a part of our healthcare platform.\n\n" +

    "With your HealHub account, you can:\n" +
    "• Search medicines across registered pharmacies.\n" +
    "• Check medicine availability in real-time.\n" +
    "• Locate nearby pharmacies.\n" +
    "• Manage your profile securely.\n\n" +

    "Please keep your login credentials safe and never share your password or OTP with anyone.\n\n" +

    "If you did not create this account, please contact our support team immediately.\n\n" +

    "Thank you for choosing HealHub.\n\n" +

    "Regards,\n" +
    "HealHub Team\n" +
    "Your Trusted Medicine Finder");
                                        
                                        Transport.send(message);

                        }

			catch (MessagingException e) 
                        {
				throw new RuntimeException(e);
			}
    }
    
}





