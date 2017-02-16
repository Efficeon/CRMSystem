package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Company;

import java.util.Collection;
import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link Company}.
 *
 * @author Leonid Dubravsky
 */
public interface CompanyDAO extends GenericDAO<Company, UUID>{
    public Collection<Company> getSortedCompanies(String name);
}
