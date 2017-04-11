package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.MailerDAO;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

/**
 * JPA implementation of {@link MailerDAO} interface.
 *
 * @author Leonid Dubravsky
 */

@Repository
public class JpaMailerDAOImpl implements MailerDAO{

    @Override
    public void sendMail(String recipientEmail, String textEmail, String subjectEmail){
        try (GenericXmlApplicationContext context = new GenericXmlApplicationContext()) {
            context.load("classpath:mailer/applicationContext.xml");
            context.refresh();
            JavaMailSender mailSender = context.getBean("mailSender", JavaMailSender.class);
            SimpleMailMessage templateMessage = context.getBean("templateMessage", SimpleMailMessage.class);

            SimpleMailMessage mailMessage = new SimpleMailMessage(templateMessage);
            mailMessage.setTo(recipientEmail);
            mailMessage.setSubject(subjectEmail);
            mailMessage.setText(textEmail);
            try {
                mailSender.send(mailMessage);
            } catch (MailException mailException) {
                mailException.printStackTrace();
            }
        }
    }
}
