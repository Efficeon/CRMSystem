package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.MailerDAO;
import net.proselyte.crmsystem.service.MailerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Implementation of {@link MailerService} interface.
 *
 * @author Leonid Dubravsky
 */

@Service
public class MailerServiceImpl implements MailerService {

    @Autowired
    MailerDAO mailerDAO;

    @Override
    public void sendMail(String recipientEmail, String textEmail, String subjectEmail) {
        mailerDAO.sendMail(recipientEmail, textEmail, subjectEmail);
    }
}
