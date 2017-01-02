

package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.RoleDAO;
import net.proselyte.crmsystem.dao.UserDAO;
import net.proselyte.crmsystem.model.Role;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

/**
 * Implementation of {@link UserService }interface
 *
 * @author Eugen Artemenko
 * @version 1.0
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private RoleDAO roleDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    @Transactional
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.getById(1L));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    @Transactional
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }
}