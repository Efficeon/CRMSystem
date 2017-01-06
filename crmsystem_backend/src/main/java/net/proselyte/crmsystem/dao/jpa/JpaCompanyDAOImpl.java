package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.CompanyDAO;
import net.proselyte.crmsystem.model.Company;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collection;
import org.apache.log4j.Logger;

/**
 * JPA implementation of {@link CompanyDAO} interface.
 *
 * @author Leonid Dubravsky
 */

@Repository
public class JpaCompanyDAOImpl implements CompanyDAO{

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaCompanyDAOImpl.class);

    @Override
    public Company getById(Long id) {
        Query query = entityManager.createQuery(
                "SELECT DISTINCT company FROM Company company LEFT JOIN FETCH company.responsibleUser WHERE company.id =:id");

        query.setParameter("id", id);
        Company company = (Company) query.getSingleResult();

        logger.info("Company successfully loaded. Company details: " + company);

        return company;
    }

    @Override
    public Collection<Company> getAll() {
        Collection<Company> result;
        Query query = entityManager.createQuery(
                "SELECT company FROM Company company LEFT JOIN FETCH company.responsibleUser");

        result = query.getResultList();

        for (Company company : result) {
            logger.info("Company list: " + company);
        }
        return result;
    }

    @Override
    public void save(Company company) {
        if (company.getId() == null) {
            this.entityManager.persist(company);
            logger.info("Company successfully saved. Company details: " + company);
        } else {
            this.entityManager.merge(company);
            logger.info("Company successfully updated. Company details: " + company);
        }
    }

    @Override
    public void remove(Company company) {
        this.entityManager.remove(this.entityManager.getReference(Company.class, company.getId()));
        logger.info("Company successfully removed. Company details: " + company);
    }
}
