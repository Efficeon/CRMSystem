package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.MessageDAO;
import net.proselyte.crmsystem.model.Message;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * JPA implementation of {@link MessageDAO} interface.
 *
 * @author Leonid Dubravsky
 */

@Repository
public class JpaMessageDAOImpl implements MessageDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaMessageDAOImpl.class);

    @Override
    public Message getById(UUID id) {
        Query query = entityManager.createQuery(
                "SELECT DISTINCT message FROM Message as message WHERE message.id=:id", Message.class);
        query.setParameter("id", id);
        Message message = (Message) query.getSingleResult();

        logger.info("Message successfully loaded. Message details: " + message);

        return message;
    }

    @Override
    public Collection<Message> getAll() {
        List<Message> result;
        Query query = entityManager.createQuery(
                "SELECT DISTINCT message FROM Message message LEFT JOIN FETCH message.author", Message.class);
        result = query.getResultList();

        for (Message message : result) {
            logger.info("Message list: " + message);
        }
        return result;
    }

    @Override
    public Collection<Message> getDialogue(String author, String recipient) {
        List<Message> resultSearch;
        Query queryForAuthor = entityManager.createQuery("SELECT DISTINCT message FROM Message message " +
                "WHERE message.author.username=:author AND message.recipient.username=:recipient OR " +
                "message.author.username=:recipient AND message.recipient.username=:author", Message.class);
        queryForAuthor.setParameter("author", author);
        queryForAuthor.setParameter("recipient", recipient);
        resultSearch=queryForAuthor.getResultList();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm");
        Collections.sort(resultSearch, new Comparator<Message>() {
            public int compare(Message o1, Message o2) {
                return dateFormat.format(o1.getCreated()).compareTo(dateFormat.format(o2.getCreated()));
            }
        });

        for (Message message : resultSearch) { logger.info("Search message list: " + message); }
        return resultSearch;
    }

    @Override
    public Collection<Message> getNewMessage(String recipient) {
        List<Message> resultSearch;
        Query queryForAuthor = entityManager.createQuery(
                "SELECT DISTINCT message FROM Message message " +
                "WHERE message.recipient.username=:recipient AND message.status=true", Message.class);
        queryForAuthor.setParameter("recipient", recipient);
        resultSearch=queryForAuthor.getResultList();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm");
        Collections.sort(resultSearch, new Comparator<Message>() {
            public int compare(Message o1, Message o2) {
                return dateFormat.format(o1.getCreated()).compareTo(dateFormat.format(o2.getCreated()));
            }
        });

        for (Message message : resultSearch) {
            logger.info("Search new message list: " + message);
        }
        return resultSearch;
    }

    @Override
    public void save(Message message) {
        if (message.getId() == null) {
            message.setCreated(new Date());
            this.entityManager.persist(message);
            logger.info("Message successfully saved. Message details: " + message);
        } else {
            message.setCreated(getById(message.getId()).getCreated());
            this.entityManager.merge(message);
            logger.info("Message successfully updated. Message details: " + message);
        }
    }

    @Override
    public void remove(Message message) {
        this.entityManager.remove(this.entityManager.getReference(Message.class, message.getId()));
        logger.info("Message successfully removed. Message details: " + message);
    }

    @Override
    public Collection<Message> getForAuthor(UUID id) {
        List<Message> resultSearch;
        Query query = entityManager.createQuery("SELECT DISTINCT message FROM Message message WHERE message.author.id=:id");
        query.setParameter(0, id);
        resultSearch=query.getResultList();
        for (Message message : resultSearch) {
            logger.info("Search message list: " + message);
        }
        return resultSearch;
    }

    @Override
    public Collection<Message> getForRecipient(UUID id) {
        List<Message> resultSearch;
        Query query = entityManager.createQuery("SELECT DISTINCT message FROM Message message WHERE message.recipient.id=:id");
        query.setParameter(0, id);
        resultSearch=query.getResultList();
        for (Message message : resultSearch) {
            logger.info("Search message list: " + message);
        }
        return resultSearch;
    }
}
