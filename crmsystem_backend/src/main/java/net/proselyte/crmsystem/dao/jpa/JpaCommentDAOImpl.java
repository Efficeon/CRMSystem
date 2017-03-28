package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.CommentDAO;
import net.proselyte.crmsystem.model.Comment;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * JPA implementation of {@link CommentDAO} interface.
 *
 * @author Leonid Dubravsky
 */

@Repository
public class JpaCommentDAOImpl implements CommentDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaCompanyDAOImpl.class);

    @Override
    public Comment getById(UUID id) {
        Query query = entityManager.createQuery(
                "SELECT comment FROM Comment as comment WHERE comment.id=:id", Comment.class);
        query.setParameter("id", id);
        Comment comment = (Comment) query.getSingleResult();

        logger.info("Comment successfully loaded. Comment details: " + comment);

        return comment;
    }

    @Override
    public Collection<Comment> getAll() {
        List<Comment> result;
        Query query = entityManager.createQuery(
                "SELECT DISTINCT comment FROM Comment comment LEFT JOIN FETCH comment.author");
        result = query.getResultList();

        for (Comment comment : result) {
            logger.info("Comment list: " + comment);
        }
        return result;
    }

    @Override
    public Collection<Comment> getForEntity(UUID id) {
        List<Comment> result;
        Query query = entityManager.createQuery(
                "SELECT DISTINCT comment FROM Comment as comment WHERE comment.entityID=:id", Comment.class);
        query.setParameter("id", id);
        result = query.getResultList();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm");
        Collections.sort(result, new Comparator<Comment>() {
            public int compare(Comment o1, Comment o2) {
                return dateFormat.format(o1.getUpdated()).compareTo(dateFormat.format(o2.getUpdated()));
            }
        });
        for (Comment comment : result) {
            logger.info("Comment for deal list: " + comment);
        }
        return result;
    }

    @Override
    public void save(Comment comment) {
        if (comment.getId() == null) {
            comment.setCreated(new Date());
            comment.setUpdated(new Date());
            this.entityManager.persist(comment);
            logger.info("Comment successfully saved. Comment details: " + comment);
        } else {
            comment.setCreated(getById(comment.getId()).getCreated());
            comment.setUpdated(new Date());
            this.entityManager.merge(comment);
            logger.info("Comment successfully updated. Comment details: " + comment);
        }
    }

    @Override
    public void remove(Comment comment) {
        this.entityManager.remove(this.entityManager.getReference(Comment.class, comment.getId()));
        logger.info("Comment successfully removed. Comment details: " + comment);
    }
}
