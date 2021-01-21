package mail;

import java.util.Properties;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;

import web.SysProps;

public class CheckMail {

	public static void main(String[] args) throws Exception {
		System.out.println("Hello....");

		SysProps sysProps = new SysProps();

		// Set mail properties and configure accordingly
		String hostval = "pop.gmail.com";

		String uname = sysProps.getProperty("mail.id");// change accordingly
		String pwd = sysProps.getProperty("mail.password");// change accordingly

		// Set property values
		Properties propvals = new Properties();
		propvals.put("mail.pop3.host", hostval);
		propvals.put("mail.pop3.port", "995");
		propvals.put("mail.pop3.starttls.enable", "true");
		Session emailSessionObj = Session.getDefaultInstance(propvals);
		// Create POP3 store object and connect with the server
		Store storeObj = emailSessionObj.getStore("pop3s");
		storeObj.connect(hostval, uname, pwd);
		// Create folder object and open it in read-only mode
		Folder emailFolderObj = storeObj.getFolder("INBOX");
		emailFolderObj.open(Folder.READ_ONLY);
		// Fetch messages from the folder and print in a loop
		Message[] messages = emailFolderObj.getMessages();
		
		System.out.println( "Message len = " + messages.length ); 

		int idx = 0 ; 
		for ( Message indvidualmsg : messages ) {
			System.out.println("Printing individual messages");
			System.out.println("No# " + (idx + 1));
			System.out.println("Email Subject: " + indvidualmsg.getSubject());
			System.out.println("Sender: " + indvidualmsg.getFrom()[0]);
			System.out.println("Content: " + indvidualmsg.getContent().toString());
			idx ++;
		}
		// Now close all the objects
		emailFolderObj.close(false);
		storeObj.close();
		
		System.out.println( "Good bye!");
	}
}