package net.proselyte.crmsystem.dao;


import net.proselyte.crmsystem.model.Contact;
import java.util.Collection;
import java.util.UUID;


/**
 * Extension of {@link GenericDAO} interface for class {@link Contact}.
 *
 * @author Leonid Dubravsky
 */
public interface ContactDAO extends GenericDAO<Contact, UUID>{
    public Collection<Contact> getSearchedContacts(String searchLine);
}
