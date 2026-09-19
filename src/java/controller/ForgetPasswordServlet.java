package controller;

import dao.UserDAO;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ForgetPasswordServlet extends HttpServlet {
    
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
                boolean isEmailExists = UserDAO.isEmailExists(email);
		
		if(email!=null || !email.equals("")) {
			// sending otp
			 Random random = new Random();

                        int otpvalue = 100000 + random.nextInt(900000);

			String to = email;
                        
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
                        
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("your_Email_Id", "your_Email_Key");// Put your email
																									// id and
																									// password here
				}
			});
			// compose message
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("HealHub Password Reset OTP");
                                message.setText("Dear User,\n\nWe received a request to reset your HealHub account password. \n\nYour One-Time Password (OTP) for password reset is: "+otpvalue+"\n\nThis OTP is valid for 5 minutes Please do not share this OTP with anyone for security reasons.\n\nIf you did not request a password reset, please ignore this email.\n\nRegards,\nTeam HealHub");
				//message.setText("your OTP is: " + otpvalue);
				// send message
				
                                if(isEmailExists)
                                {
                                    Transport.send(message);
                                    System.out.println("message sent successfully");
                                }
                                else
                                {
                                    System.out.println("message not sent");
                                }
				
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
                        
			
                        HttpSession mySession = request.getSession();
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email4forget",email); 
			
                        response.sendRedirect("enterOtp.jsp");
		}
		
	}

}
