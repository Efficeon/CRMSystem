package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Message;

import java.util.Collection;
import java.util.UUID;

/**
 * Service for messaging.
 *
 * @author Leonid Dubravsky
 */

public interface MessageService {

    Message getById(UUID id);

    Collection<Message> getAll();

    void save(Message message);

    void remove(Message message);

    public Collection<Message> getForAuthor(UUID id);

    public Collection<Message> getForRecipient(UUID id);

    public Collection<Message> getDialogue(String author, String recipient);

    public Collection<Message> getNewMessage(String recipient);
}
