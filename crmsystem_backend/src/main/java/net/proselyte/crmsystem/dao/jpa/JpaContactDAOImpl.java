package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.ContactDAO;
import net.proselyte.crmsystem.model.Contact;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collection;

/**
 * JPA implmentation of {@link ContactDAO} interface.
 *
 * @author Maxim Sasakin
 */

@Repository
public class JpaContactDAOImpl implements ContactDAO {

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaContactDAOImpl.class);

    @Override
    public Contact getById(Long id) {
        Query query = this.entityManager.createQuery("SELECT DISTINCT contact FROM  Contact contact WHERE contact.id =:id");
        query.setParameter("id", id);
        Contact contact = (Contact) query.getSingleResult();

        logger.info("Contact successfully loaded. Contact details: " + contact);

        return contact;
    }

    @Override
    public Collection<Contact> getAll() {
        Collection<Contact> result;

        Query query = this.entityManager.createQuery("SELECT DISTINCT contact FROM Contact contact");
        result = query.getResultList();

        for (Contact contact : result) {
            logger.info("Contact list: " + contact);
        }

        return result;
    }

    @Override
    public void save(Contact contact) {

        if (contact.getId() == null) {
            this.entityManager.persist(contact);
            logger.info("Contact successfully saved. Contact details: " + contact);
        } else {
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
    public Contact findByCompanyName(String companyName) {

        try {
            Query query = this.entityManager.createQuery("FROM Contact contact WHERE contact.company=:companyName", Contact.class);
            query.setParameter("companyName", companyName);
            Contact contact = (Contact) query.getSingleResult();
            return contact;
        } catch (NoResultException e) {
            return null;
        }
    }
}
