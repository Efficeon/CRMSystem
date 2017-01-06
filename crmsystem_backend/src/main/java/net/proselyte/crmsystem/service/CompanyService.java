package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Company;

import java.util.Collection;

/**
 * Service interface for class {@link Company}.
 *
 * @author Leonid Dubravsky
 */
public interface CompanyService {

    Company getById(Long id);

    Collection<Company> getAll();

    void save(Company company);

    void remove(Company company);
}
