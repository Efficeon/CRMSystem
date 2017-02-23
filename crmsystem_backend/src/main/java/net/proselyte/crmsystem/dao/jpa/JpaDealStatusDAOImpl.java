package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.DealStatusDAO;
import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.DealStatus;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

/**
 * JPA implementation of {@link net.proselyte.crmsystem.dao.DealStatusDAO} interface.
 *
 * @author Serhiy Zamikhovskyy
 */

@Repository
public class JpaDealStatusDAOImpl implements DealStatusDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaDealStatusDAOImpl.class);



    @Override
    public DealStatus getById(UUID id) {
        Query query = this.entityManager.createQuery(
                "SELECT DISTINCT dealStatus FROM DealStatus dealStatus WHERE dealStatus.id =:id");

        query.setParameter("id", id);
        DealStatus dealStatus = (DealStatus) query.getSingleResult();

        logger.info("DealStatus successfully loaded. DealStatus details: " + dealStatus);

        return dealStatus;
    }

    @Override
    public Collection<DealStatus> getAll() {
        Query query = this.entityManager.createQuery(
                "SELECT distinct dealStatus From DealStatus dealStatus");

        List<DealStatus> dealStatusList = query.getResultList();
        logger.info("DealStatus list successfully loaded. DealStatus list details: " + dealStatusList);
        return dealStatusList;
    }

    @Override
    public void save(DealStatus entity) {
        if(entity.getId() == null){
            this.entityManager.persist(entity);
            logger.info("DealStatus entity succesfully saved. Dealstatus details:" + entity);
        } else {
            this.entityManager.merge(entity);
            logger.info("DealStatus entity succesfully updated. Dealstatus details:" + entity);
        }
    }

    @Override
    public void remove(DealStatus entity) {
        this.entityManager.remove(this.entityManager.getReference(DealStatus.class, entity.getId()));
        logger.info("DealStatus entity successfully removed. DealStatus details:" + entity);
    }
}
