package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.RoleDAO;
import net.proselyte.crmsystem.model.Role;
import net.proselyte.crmsystem.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link RoleService} interface.
 *
 * @author Eugene Suleimanov
 */

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @Override
    @Transactional
    public Role getById(UUID id) {
        return roleDAO.getById(id);
    }

    @Override
    @Transactional
    public Collection<Role> getAll() {
        return roleDAO.getAll();
    }

    @Override
    @Transactional
    public void save(Role role) {
        roleDAO.save(role);
    }

    @Override
    @Transactional
    public void remove(Role role) {
        roleDAO.remove(role);
    }
}