package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.ContactDAO;
import net.proselyte.crmsystem.model.Contact;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.*;

/**
 * JPA implmentation of {@link ContactDAO} interface.
 *
 * @author Leonid Dubravsky
 */

@Repository
public class JpaContactDAOImpl implements ContactDAO {

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaContactDAOImpl.class);

    @Override
    public Contact getById(UUID id) {
        Query query = this.entityManager.createQuery("SELECT DISTINCT contact FROM Contact contact WHERE contact.id =:id");
        query.setParameter("id", id);
        Contact contact = (Contact) query.getSingleResult();

        logger.info("Contact successfully loaded. Contact details: " + contact);

        return contact;
    }

    @Override
    public Collection<Contact> getAll() {
        List<Contact> result;

        Query query = this.entityManager.createQuery("SELECT DISTINCT contact FROM Contact contact LEFT JOIN FETCH contact.responsibleUser LEFT JOIN FETCH contact.associatedCompany");
        result = query.getResultList();
        for (Contact contact : result){
            System.out.println(result);
        }

        Collections.sort(result, new Comparator<Contact>() {
            public int compare(Contact o1, Contact o2) {
                return o1.getName().compareTo(o2.getName());
            }
        });
        for (Contact contact : result) {
            logger.info("Contact list: " + contact);
        }
        return result;
    }

    @Override
    public void save(Contact contact) {

        if (contact.getId() == null) {
            contact.setCreateDate(new Date());
            contact.setUpdateDate(new Date());
            this.entityManager.persist(contact);
            logger.info("Contact successfully saved. Contact details: " + contact);
        } else {
            contact.setCreateDate(getById(contact.getId()).getCreateDate());
            contact.setUpdateDate(new Date());
            this.entityManager.merge(contact);
            logger.info("Contact successfully updated. Contact details: " + contact);
        }
    }

    @Override
    public void remove(Contact contact) {

        this.entityManager.remove(contact);
        logger.info("Contact successfully removed. Contact details: " + contact);
    }

    @Override
    public Collection<Contact> getSearchedContacts(String searchLine) {
        List<Contact> resultSearch;
        Query query = entityManager.createQuery("SELECT DISTINCT contact FROM Contact contact LEFT JOIN contact.responsibleUser LEFT JOIN FETCH contact.associatedСompany WHERE contact.name LIKE ?");
        query.setParameter(0, "%"+searchLine+"%");
        resultSearch=query.getResultList();
        for (Contact contact : resultSearch) {
            logger.info("Search contact list: " + contact);
        }
        return resultSearch;
    }
}
