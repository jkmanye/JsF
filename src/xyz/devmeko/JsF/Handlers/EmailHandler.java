package xyz.devmeko.JsF.Handlers;

import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.activation.FileDataSource;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import xyz.devmeko.JsF.Handlers.CaptchaHandler.Captcha;

import java.io.File;
import java.util.Properties;

public class EmailHandler {

    public void sendCaptchaMail(String to, String code) {
        String from = "noreply.mtf.authenticator@gmail.com";
        String pw = "nswhqozdnaqjkers";

        Properties props = System.getProperties();

        props.put("mail.smtp.ssl.enable", "false");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.fallback", "false");

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pw);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("캡챠 인증을 완료해주세요.");

            BodyPart bodyPart = new MimeBodyPart();
            bodyPart.setText("다음 코드를 앱의 인증번호 입력란에 입력하세요.");
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(bodyPart);

            bodyPart = new MimeBodyPart();
            File captcha = new Captcha().export(code, to);
//            System.out.println(captcha.getAbsolutePath());
            DataSource source = new FileDataSource(captcha);
            bodyPart.setDataHandler(new DataHandler(source));
            bodyPart.setFileName(to + ".png");
            multipart.addBodyPart(bodyPart);

            message.setContent(multipart);

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendEmail(String to, String subject, String msg) {
        String from = "noreply.mtf.authenticator@gmail.com";
        String pw = "nswhqozdnaqjkers";

        System.out.println(pw);

        Properties props = System.getProperties();

        props.put("mail.smtp.ssl.enable", "false");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.fallback", "false");
//        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pw);
            }
        });

//        session.setDebug(true);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(msg);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
