package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.CompanyDAO;
import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link CompanyService} interface.
 *
 * @author Leonid Dubravsky
 */

@Service
public class CompanyServiceImpl implements CompanyService{

    @Autowired
    CompanyDAO companyDAO;

    @Override
    @Transactional
    public Company getById(UUID id) {
        return companyDAO.getById(id);
    }

    @Override
    @Transactional
    public Collection<Company> getAll() {
        return companyDAO.getAll();
    }

    @Override
    @Transactional
    public Collection<Company> getSearchedCompanies(String searchLine) {
        return companyDAO.getSortedCompanies(searchLine);
    }

    @Override
    @Transactional
    public void save(Company company) {
        companyDAO.save(company);
    }

    @Override
    @Transactional
    public void remove(Company company) {
        companyDAO.remove(company);
    }
}
