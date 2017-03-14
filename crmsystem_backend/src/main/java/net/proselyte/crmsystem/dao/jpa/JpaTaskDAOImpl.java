package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.TaskDAO;
import net.proselyte.crmsystem.model.Task;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * JPA implementation {@link TaskDAO}.
 *
 * @author Vladimir Vitlitski
 */

@Repository
public class JpaTaskDAOImpl implements TaskDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaTaskDAOImpl.class);

    @Override
    public Task getById(UUID id) {
        Query query = entityManager.createQuery(
//                "SELECT DISTINCT task FROM Task task LEFT JOIN FETCH task.implementer WHERE task.id =:id");
                "SELECT task FROM Task as task WHERE task.id=:id", Task.class);

        query.setParameter("id", id);
        Task task = (Task) query.getSingleResult();

        logger.info("Task successfully loaded. Task details: " + task);

        return task;
    }

    @Override
    public List<Task> getAll() {
        List<Task> result;
        Query query = entityManager.createQuery(
                "SELECT DISTINCT task FROM Task task LEFT JOIN FETCH task.implementer");
//                "SELECT task FROM Task as task LEFT JOIN task.implementer as implementer", Task.class);
        result = query.getResultList();

        Collections.sort(result, (o1, o2) -> o1.getName().compareTo(o2.getName()));

        for (Task task : result) {
            int i = 0;
            logger.info("Task №" + i++ +": " + task);
        }
        return result;
    }

    @Override
    public void save(Task task) {
//            if (task.getId() == null) {
            task.setCreated(new Date());
            task.setUpdated(new Date());
            this.entityManager.persist(task);
            logger.info("Task successfully saved. Task details: " + task);
//        } else {
//            task.setCreated(getById(task.getId()).getCreated());
//            task.setUpdated(new Date());
//            this.entityManager.merge(task);
//            logger.info("Task successfully updated. Task details: " + task);
//        }
    }

    @Override
    public void remove(Task task) {
        this.entityManager.remove(this.entityManager.getReference(Task.class, task.getId()));
        logger.info("Task successfully removed. Task details: " + task);
    }

    @Override
    public Task edit(Task task) {
        Query query = this.entityManager.createQuery(
                "SELECT task FROM Task as task WHERE task.id=:id", Task.class);
        query.setParameter("id", task.getId());
        Task existingTask = (Task) query.getSingleResult();

        existingTask.setName(task.getName());
        existingTask.setDescription(task.getDescription());
        existingTask.setImplementer(task.getImplementer());
        existingTask.setCreated(task.getCreated());
        existingTask.setUpdated(new Date());
/**
 * entityManager.merge() -- вернет Task !!!
 */
        return this.entityManager.merge(existingTask);
    }
}

