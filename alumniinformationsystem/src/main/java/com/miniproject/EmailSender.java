package com.miniproject;

import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {

	public static boolean secretMail(String msg, String name, List<String> recipients) {
	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.port", "465");

	    // Create a session with authentication
	    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication("alumniinfosystem11@gmail.com", "whsg udrl byce zvji"); // Use app password
	        }
	    });

	    try {
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress("alumniinfosystem11@gmail.com")); // Proper from address

	        // Convert recipient list to comma-separated string
	        String allRecipients = String.join(",", recipients);
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(allRecipients));

	        message.setSubject("ALERT | Alumni Information System | KITS NZB");
	        message.setText(msg);

	        Transport.send(message);
	        System.out.println("Email sent successfully.");
	        return true;

	    } catch (Exception e) {
	        System.out.println("Failed to send email: " + e);
	        return false;
	    }
	}

	// Sample usage
	public static void main(String[] args) {
	    List<String> emails = Arrays.asList("ankithapallikondawar@gmail.com", "ramavathvasantha80@gmail.com", "nemurisathwikagoud@gmail.com","sanjanadomala07@gmail.com","missbakhanam6@gmail.com");
	    boolean sent = secretMail("Test email to multiple recipients", "Alumni System", emails);
	    System.out.println("Result: " + sent);
	}

}

