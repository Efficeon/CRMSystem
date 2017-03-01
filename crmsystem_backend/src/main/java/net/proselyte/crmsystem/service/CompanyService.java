package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.User;

import java.util.Collection;
import java.util.UUID;

/**
 * Service interface for class {@link Company}.
 *
 * @author Leonid Dubravsky
 */
public interface CompanyService {

    Company getById(UUID id);

    Collection<Company> getAll();

    void save(Company company);

    void remove(Company company);

    Collection<Company> getSearchedCompanies(String searchLine);
}