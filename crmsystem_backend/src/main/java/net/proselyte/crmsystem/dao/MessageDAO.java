package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Message;

import java.util.Collection;
import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link Message}.
 *
 * @author Leonid Dubravsky
 */

public interface MessageDAO extends GenericDAO<Message, UUID>{

    public Collection<Message> getForAuthor(UUID id);

    public Collection<Message> getForRecipient(UUID id);

    public Collection<Message> getDialogue(String author, String recipient);

    public Collection<Message> getNewMessage(String recipient);
}
