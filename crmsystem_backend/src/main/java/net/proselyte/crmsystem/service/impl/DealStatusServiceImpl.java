package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.jpa.JpaDealStatusDAOImpl;
import net.proselyte.crmsystem.model.DealStatus;
import net.proselyte.crmsystem.service.DealStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of interface of {@link net.proselyte.crmsystem.service.DealStatusService}.
 *
 * @author Serhiy Zamikhovskyy
 */

@Service
public class DealStatusServiceImpl implements DealStatusService{

    @Autowired
    JpaDealStatusDAOImpl jpaDealStatusDAO;


    @Override
    @Transactional
    public DealStatus getById(UUID id) {
        return jpaDealStatusDAO.getById(id);

    }

    @Override
    @Transactional
    public Collection<DealStatus> getAll() {
        return jpaDealStatusDAO.getAll();
    }

    @Override
    @Transactional
    public void save(DealStatus entity) {
        jpaDealStatusDAO.save(entity);
    }

    @Override
    @Transactional
    public void remove(DealStatus entity) {
        jpaDealStatusDAO.remove(entity);

    }
}
