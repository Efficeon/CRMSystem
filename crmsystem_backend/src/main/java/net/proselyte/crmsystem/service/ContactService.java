package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Contact;

import java.util.Collection;
import java.util.UUID;

/**
 * service class for {@link Contact}
 *
 * @author Leonid Dubravsky
 */

public interface ContactService {

    Contact getById(UUID id);

    Collection<Contact> getAll();

    void save(Contact contact);

    void remove(Contact contact);

    Collection<Contact> getSearchedContact(String searchLine);
}
