package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Contact;

import java.util.Collection;
import java.util.UUID;

/**
 * service class for {@link Contact}
 *
 * @author Maxim Sasakin
 */

public interface ContactService {

    void save(Contact contact);

    Contact findByCompanyName(String companyName);

    Contact getById(UUID id);

    Collection getAll();
}
