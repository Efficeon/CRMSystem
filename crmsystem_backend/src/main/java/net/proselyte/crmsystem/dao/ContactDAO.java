package net.proselyte.crmsystem.dao;


import net.proselyte.crmsystem.model.Contact;

import java.util.UUID;


/**
 * Extension of {@link GenericDAO} interface for class {@link Contact}.
 *
 * @author Maxim Sasakin
 */
public interface ContactDAO extends GenericDAO<Contact, UUID>{

    Contact findByCompanyName(String companyName);

}
