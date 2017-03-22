package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.CompanyDAO;
import net.proselyte.crmsystem.model.Company;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.*;

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
    public Company getById(UUID id) {
        Query query = entityManager.createQuery(
                "SELECT DISTINCT company FROM Company company LEFT JOIN FETCH company.responsibleUser LEFT JOIN FETCH company.associatedContacts WHERE company.id =:id");

        query.setParameter("id", id);
        Company company = (Company) query.getSingleResult();

        logger.info("Company successfully loaded. Company details: " + company);

        return company;
    }

    @Override
    public Collection<Company> getAll() {
        List<Company> result;

        Query query = entityManager.createQuery(
                "SELECT DISTINCT company FROM Company company LEFT JOIN FETCH company.responsibleUser LEFT JOIN FETCH company.tags LEFT JOIN FETCH company.associatedContacts ");

        result = query.getResultList();

        Collections.sort(result, new Comparator<Company>() {
            public int compare(Company o1, Company o2) {
                return o1.getName().compareTo(o2.getName());
            }
        });

        for (Company company : result) {
            logger.info("Company list: " + company);
        }
        return result;
    }

    @Override
    public void save(Company company) {
        if (company.getId() == null) {
            company.setCreated(new Date());
            this.entityManager.persist(company);
            logger.info("Company successfully saved. Company details: " + company);
        } else {
            company.setCreated(getById(company.getId()).getCreated());
            company.setUpdated(new Date());
            this.entityManager.merge(company);
            logger.info("Company successfully updated. Company details: " + company);
        }
    }

    @Override
    public void remove(Company company) {
        this.entityManager.remove(this.entityManager.getReference(Company.class, company.getId()));
        logger.info("Company successfully removed. Company details: " + company);
    }

    @Override
    public Collection<Company> getSearchedCompanies(String searchLine) {
        List<Company> resultSearch;
        Query query = entityManager.createQuery("SELECT DISTINCT company FROM Company company LEFT JOIN FETCH company.responsibleUser LEFT JOIN FETCH company.tags LEFT JOIN FETCH company.associatedContacts WHERE company.name LIKE ?");
            query.setParameter(0, "%"+searchLine+"%");
            resultSearch=query.getResultList();
        for (Company company : resultSearch) {
            logger.info("Search company list: " + company);
        }
        return resultSearch;
    }
}
