package mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import web.SysProps;

public class SendEmail {
	
	public static void main(String[] args) throws Exception {
		System.out.println("Sending email now ...");

		// Recipient's email ID needs to be mentioned.
		String to = "sunabove@nate.com";

		// Sender's email ID needs to be mentioned
		String from = "terabuilder@gmail.com";
		
		SysProps sysProps = new SysProps();
		
		String username = sysProps.getProperty( "mail.id" );// change accordingly
		String password = sysProps.getProperty( "mail.password" );// change accordingly

		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		// Create a default MimeMessage object.
		Message message = new MimeMessage(session);
		
		// Set From: header field of the header.
		message.setFrom(new InternetAddress(from));
		// Set To: header field of the header.
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		// Set Subject: header field
		message.setSubject("Testing Subject : " + new Date());
		// Now set the actual message
		String text = "";
		text += "Hello, this is sample for to check send email using JavaMailAPI at " + new Date() + "." ; 
		message.setText(text);

		// Send message
		Transport.send(message);

		System.out.println("Sent message successfully.");
	}
}