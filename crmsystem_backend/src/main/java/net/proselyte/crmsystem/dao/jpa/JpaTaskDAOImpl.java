package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.TaskDAO;
import net.proselyte.crmsystem.model.Task;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collection;

/**
 * JPA implementation {@link TaskDAO}.
 *
 * @author Vladimir Vitlickij
 */

@Repository
public class JpaTaskDAOImpl implements TaskDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaTaskDAOImpl.class);

    @Override
    public Task getById(Long id) {
        Query query = entityManager.createQuery(
                "SELECT DISTINCT task FROM Task task LEFT JOIN FETCH task.responsibleUser WHERE task.id =:id");

        query.setParameter("id", id);
        Task task = (Task) query.getSingleResult();

        logger.info("Task successfully loaded. Task details: " + task);

        return task;
    }

    @Override
    public Collection<Task> getAll() {
        Collection<Task> result;
        Query query = entityManager.createQuery(
                "SELECT task FROM Task task LEFT JOIN FETCH task.responsibleUser");

        result = query.getResultList();

        for (Task task : result) {
            logger.info("Task list: " + task);
        }
        return result;
    }

    @Override
    public void save(Task task) {
        if (task.getId() == null) {
            this.entityManager.merge(task);
            logger.info("Task successfully updated. Task details: " + task);
        } else {
            this.entityManager.persist(task);
            logger.info("Task successfully saved. Task details: " + task);
        }
    }

    @Override
    public void remove(Task task) {
        this.entityManager.remove(this.entityManager.getReference(Task.class, task.getId()));
        logger.info("Task successfully removed. Task details: " + task);
    }
}

