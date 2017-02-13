package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.DealDAO;
import net.proselyte.crmsystem.model.Deal;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.*;
import java.lang.Override;
import java.util.*;

/**
 * JPA implementation of {@link net.proselyte.crmsystem.dao.DealDAO} interface.
 *
 * @author Serhiy Zamikhovskyy
 */

@Repository
public class JpaDealDAOImpl implements DealDAO {

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaDealDAOImpl.class);

    @SuppressWarnings("unchecked")
//    @Override
    public Deal getById(UUID id) {
        Query query = this.entityManager.createQuery("SELECT DISTINCT  deal FROM  Deal deal WHERE deal.id =:id");
        query.setParameter("id", id);

        Deal deal = (Deal) query.getSingleResult();
        logger.info("Deal successfully loaded. Deal details: " + deal);

        return deal;
    }


    public Collection<Deal> getAll() {
            List<Deal> result = new ArrayList<>();
            Query query = this.entityManager.createQuery("SELECT DISTINCT deal FROM Deal deal LEFT JOIN FETCH deal.responsibleUser");
            result = query.getResultList();
            if(result == null) {
                System.out.println("RESULT == NULL!!");
                logger.info("RESULT == NULL!!");

            }
            for (Deal deal : result) {
                logger.info("deal list: " + deal);

            }

            return result;
    }

    @Override
    public void save(Deal deal) {
        if (deal.getId() == null) {
            this.entityManager.persist(deal);
            logger.info("Deal successfully saved. Deal details: " + deal);
        } else {
            this.entityManager.merge(deal);
            logger.info("Deal successfully updated. Deal details: " + deal);
        }
    }

    @Override
    public void remove(Deal deal) {
        this.entityManager.remove(deal);
        logger.info("Deal successfully removed. Deal details: " + deal);
    }

    @Override
    public Deal findByResponsibleUser(UUID id){
        Query query = this.entityManager.createQuery("SELECT deal FROM  Deal deal WHERE deal.responsibleUser.id =:id");
        query.setParameter("id", id);

        Deal deal = (Deal) query.getSingleResult();
        logger.info("Deal successfully loaded. Deal details: " + deal);

        return deal;
    }


}
