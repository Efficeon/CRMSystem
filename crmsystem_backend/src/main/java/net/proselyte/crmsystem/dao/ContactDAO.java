package net.proselyte.crmsystem.dao;


import net.proselyte.crmsystem.model.Contact;


/**
 * Extension of {@link GenericDAO} interface for class {@link Contact}.
 *
 * @author Maxim Sasakin
 */
public interface ContactDAO extends GenericDAO<Contact, Long>{

    Contact findByCompanyName(String companyName);

}
