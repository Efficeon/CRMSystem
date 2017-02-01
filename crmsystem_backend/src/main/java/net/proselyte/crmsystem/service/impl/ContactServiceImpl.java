package net.proselyte.crmsystem.service.impl;


import net.proselyte.crmsystem.dao.ContactDAO;
import net.proselyte.crmsystem.model.Contact;
import net.proselyte.crmsystem.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link ContactService }interface
 *
 * @author Maxim Sasakin
 * @version 1.0
 */

public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactDAO contactDAO;

    @Override
    @Transactional
    public void save(Contact contact) {
        contactDAO.save(contact);
    }

    @Override
    @Transactional
    public Contact findByCompanyName(String companyName) {
        return contactDAO.findByCompanyName(companyName);
    }

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
}
