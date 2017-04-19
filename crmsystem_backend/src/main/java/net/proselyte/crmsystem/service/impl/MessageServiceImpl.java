package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.MessageDAO;
import net.proselyte.crmsystem.model.Message;
import net.proselyte.crmsystem.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link MessageService} interface.
 *
 * @author Leonid Dubravsky
 */

@Service
public class MessageServiceImpl implements MessageService{

    @Autowired
    MessageDAO messageDAO;

    @Override
    @Transactional
    public Message getById(UUID id) {
        return messageDAO.getById(id);
    }

    @Override
    @Transactional
    public Collection<Message> getAll() {
        return messageDAO.getAll();
    }

    @Override
    @Transactional
    public void save(Message message) {
        messageDAO.save(message);
    }

    @Override
    @Transactional
    public void remove(Message message) {
        messageDAO.remove(message);
    }

    @Override
    @Transactional
    public Collection<Message> getForAuthor(UUID id) {
        return messageDAO.getForAuthor(id);
    }

    @Override
    @Transactional
    public Collection<Message> getForRecipient(UUID id) {
        return messageDAO.getForRecipient(id);
    }

    @Override
    @Transactional
    public Collection<Message> getDialogue(String author, String recipient) {
        return messageDAO.getDialogue(author, recipient);
    }

    @Override
    @Transactional
    public Collection<Message> getNewMessage(String recipient){
        return messageDAO.getNewMessage(recipient);
    }
}
