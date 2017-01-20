package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.TagDAO;
import net.proselyte.crmsystem.model.Tag;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * JPA implementation of {@link TagDAO} interface.
 *
 * @author Leonid Dubravsky
 */

@Repository
public class JpaTagDAOImpl implements TagDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaCompanyDAOImpl.class);


    @Override
    public Tag getById(Long id) {
        Query query = entityManager.createQuery(
                "SELECT DISTINCT tag FROM Tag tag LEFT JOIN FETCH tag.linkedCompanies WHERE tag.id =:id");

        query.setParameter("id", id);
        Tag tag = (Tag) query.getSingleResult();

        logger.info("Company successfully loaded. Company details: " + tag);

        return tag;
    }

    @Override
    public Tag getByName(String name) {
        Query query = entityManager.createQuery(
                "SELECT DISTINCT tag FROM Tag tag LEFT JOIN FETCH tag.linkedCompanies WHERE tag.name =:name");

        query.setParameter("name", name);
        Tag tag = (Tag) query.getSingleResult();

        logger.info("Company successfully loaded. Company details: " + tag);

        return tag;
    }

    @Override
    public Collection<Tag> getAll() {
        List<Tag> result;

        Query query = entityManager.createQuery(
                "SELECT DISTINCT tag FROM  Tag tag  LEFT JOIN FETCH tag.linkedCompanies");

        result = query.getResultList();

        Collections.sort(result, new Comparator<Tag>() {
            public int compare(Tag o1, Tag o2) {
                return o1.getName().compareTo(o2.getName());
            }
        });

        for (Tag tag : result) {
            logger.info("Tag list: " + tag);
        }
        return result;
    }

    @Override
    public void save(Tag tag) {
        if (tag.getId() == null) {
            this.entityManager.persist(tag);
            logger.info("Tag successfully saved. Tag details: " + tag);
        } else {
            this.entityManager.merge(tag);
            logger.info("Tag successfully updated. Tag details: " + tag);
        }
    }

    @Override
    public void remove(Tag tag) {
        this.entityManager.remove(this.entityManager.getReference(Tag.class, tag.getId()));
        logger.info("Tag successfully removed. Tag details: " + tag);
    }
}
