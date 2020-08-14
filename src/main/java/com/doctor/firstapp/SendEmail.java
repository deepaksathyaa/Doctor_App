package com.doctor.firstapp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.web.multipart.MultipartFile;

public class SendEmail {
	public void mailsent(String doctor, MultipartFile files, String patient,String Subject,String body) {
		//authentication info
		final String username = "doctorapplication001@gmail.com";
		final String password = "mohan007";
		String fromEmail = "doctorapplication001@gmail.com";
		String toEmail = doctor + ",arumugamtp95@gmail.com";
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipients(Message.RecipientType.CC, InternetAddress.parse(toEmail));
			msg.setSubject(Subject);
			
			Multipart emailContent = new MimeMultipart();
			
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(body);
			
			MimeBodyPart pdfAttachment = new MimeBodyPart();
			pdfAttachment.attachFile(convertMultiPartToFile(files));
			
			emailContent.addBodyPart(textBodyPart);
			emailContent.addBodyPart(pdfAttachment);
			
			msg.setContent(emailContent);
			
			Transport.send(msg);
			System.out.println("Sent message");
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public File convertMultiPartToFile(MultipartFile file ) throws IOException
    {
        File convFile = new File( file.getOriginalFilename() );
        FileOutputStream fos = new FileOutputStream( convFile );
        fos.write( file.getBytes() );
        fos.close();
        return convFile;
    }
	public void mailsentprescription(MultipartFile files, String email, String sub, String body) {
		// TODO Auto-generated method stub
		final String username = "doctorapplication001@gmail.com";
		final String password = "mohan007";
		String fromEmail = "doctorapplication001@gmail.com";
		String toEmail = email;
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			msg.setSubject(sub);
			
			Multipart emailContent = new MimeMultipart();
			
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(body);
			
			MimeBodyPart pdfAttachment = new MimeBodyPart();
			pdfAttachment.attachFile(convertMultiPartToFile(files));
			
			emailContent.addBodyPart(textBodyPart);
			emailContent.addBodyPart(pdfAttachment);
			
			msg.setContent(emailContent);
			
			Transport.send(msg);
			System.out.println("Sent message");
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void sendEmailauto(String email, String sub, String body) throws IOException {
		// TODO Auto-generated method stub
		final String username = "doctorapplication001@gmail.com";
		final String password = "mohan007";
		String fromEmail = "doctorapplication001@gmail.com";
		String toEmail = email;
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			msg.setSubject(sub);
			
			Multipart emailContent = new MimeMultipart();
			
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(body);
			
			
			
			emailContent.addBodyPart(textBodyPart);
			
			msg.setContent(emailContent);
			
			Transport.send(msg);
			System.out.println("Sent message");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
		
		public static void sendEmailpres(String email, String sub, String body) throws IOException {
			// TODO Auto-generated method stub
			final String username = "doctorapplication001@gmail.com";
			final String password = "mohan007";
			String fromEmail = "doctorapplication001@gmail.com";
			String toEmail = email;
			
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");
			
			Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username,password);
				}
			});
			MimeMessage msg = new MimeMessage(session);
			try {
				msg.setFrom(new InternetAddress(fromEmail));
				msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
				msg.setSubject(sub);
				
				Multipart emailContent = new MimeMultipart();
				
				MimeBodyPart textBodyPart = new MimeBodyPart();
				textBodyPart.setText(body);
				
				
				
				emailContent.addBodyPart(textBodyPart);
				
				msg.setContent(emailContent);
				
				Transport.send(msg);
				System.out.println("Sent message");
			} catch (MessagingException e) {
				e.printStackTrace();
			}

		
	}
	public void sendforgetmail(String email, String sub, String body) {
		
		final String username = "doctorapplication001@gmail.com";
		final String password = "mohan007";
		String fromEmail = "doctorapplication001@gmail.com";
		String toEmail = email;
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			msg.setSubject(sub);
			
			Multipart emailContent = new MimeMultipart();
			
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(body);
			
			
			
			emailContent.addBodyPart(textBodyPart);
			
			msg.setContent(emailContent);
			
			Transport.send(msg);
			System.out.println("Sent message");
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		
	}
	

}
