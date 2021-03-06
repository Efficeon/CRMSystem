package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.DealDAO;
import net.proselyte.crmsystem.model.Comment;
import net.proselyte.crmsystem.model.Deal;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.Override;
import java.util.*;
import java.util.Date;
import java.util.regex.Pattern;

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


    public Deal getById(UUID id) {
        Query query = this.entityManager.createQuery("SELECT DISTINCT  deal FROM  Deal deal LEFT JOIN FETCH deal.responsibleUser LEFT JOIN FETCH deal.associatedContact WHERE deal.id =:id");
        query.setParameter("id", id);

        Deal deal = (Deal) query.getSingleResult();
        logger.info("Deal successfully loaded. Deal details: " + deal);

        return deal;
    }


    public Collection<Deal> getAll() {
        List<Deal> result = new ArrayList<>();
        Query query = this.entityManager.createQuery("SELECT DISTINCT deal FROM Deal deal LEFT JOIN FETCH deal.responsibleUser LEFT JOIN FETCH deal.associatedContact");
        result = query.getResultList();
        if(result == null) {
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
            deal.setCreated(new Date());
            deal.setUpdated(new Date());
            this.entityManager.persist(deal);
            logger.info("Deal successfully saved. Deal details: " + deal);
        } else {
            deal.setCreated(getById(deal.getId()).getCreated());
            deal.setUpdated(new Date());
            this.entityManager.merge(deal);
            logger.info("Deal successfully updated. Deal details: " + deal);
        }
    }

    @Override
    public void remove(Deal deal) {
        this.entityManager.remove(this.entityManager.getReference(Deal.class, deal.getId()));
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

    @Override
    public Collection<Deal> findByStatus(String name){
        Query query = this.entityManager.createQuery("SELECT deal FROM  Deal deal LEFT JOIN FETCH deal.dealStatus WHERE deal.dealStatus.name =:name");
        query.setParameter("name", name);
        List<Deal> result = new ArrayList<>();
        result = query.getResultList();

        for (Deal deal : result) {
            logger.info("Deal successfully loaded. Deal details: " + deal);
        }
        return result;
    }

    @Override
    public Collection<Deal> getSearchedDeals(String searchLine) {
        List<Deal> resultSearch;
        boolean match;
        Query query;
        if ((match = Pattern.matches("[0-9]+([,.][0-9]{1,2})?", searchLine)) == true) {
            query = entityManager.createQuery("SELECT DISTINCT deal FROM Deal deal LEFT JOIN FETCH deal.responsibleUser LEFT JOIN FETCH deal.associatedContact WHERE deal.budget = ?");
            query.setParameter(0, Double.parseDouble(searchLine));
            resultSearch = query.getResultList();
        } else {
            query = entityManager.createQuery("SELECT DISTINCT deal FROM Deal deal LEFT JOIN FETCH deal.responsibleUser LEFT JOIN FETCH deal.associatedContact WHERE deal.name LIKE ?");
            query.setParameter(0, "%"+searchLine+"%");
            resultSearch=query.getResultList();
        }
        for (Deal deal : resultSearch) {
            logger.info("Search deal list: " + deal);
        }
        return resultSearch;
    }
}
