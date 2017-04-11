package net.proselyte.crmsystem.service;

/**
 * Service interface for send Email.
 *
 * @author Leonid Dubravsky
 */

public interface MailerService {

    void sendMail(String recipientEmail, String textEmail, String subjectEmail);
}
