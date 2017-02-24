package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.ContactDAO;
import net.proselyte.crmsystem.model.Contact;
import net.proselyte.crmsystem.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link ContactService }interface
 *
 * @author Maxim Sasakin
 * @version 1.0
 */

@Service
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactDAO contactDAO;

    @Override
    @Transactional
    public Contact getById(UUID id) {
        return contactDAO.getById(id);
    }

    @Override
    @Transactional
    public Collection getAll() {
        return contactDAO.getAll();
    }

    @Override
    @Transactional
    public void save(Contact contact) {
        contactDAO.save(contact);
    }

    @Override
    @Transactional
    public void remove(Contact contact) {
    contactDAO.remove(contact);
    }

    @Override
    @Transactional
    public Collection<Contact> getSearchedContact(String searchLine) {
    return contactDAO.getSearchedContacts(searchLine);
    }
}
