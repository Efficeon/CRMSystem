package net.proselyte.crmsystem.dao;

/**
 * Mailer DAO interface. Used as a mail interface for send mail.
 *
 * @author Leonid Dubravsky
 */
public interface MailerDAO {
    public void sendMail(String recipientEmail, String textEmail, String subjectEmail);
}
