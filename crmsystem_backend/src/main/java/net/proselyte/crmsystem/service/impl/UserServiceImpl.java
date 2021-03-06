

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

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

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
        roles.add(roleDao.findByName("ROLE_USER"));
        user.setUserType("ROLE_USER");
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    @Transactional
    public void remove(User user) {
        userDao.remove(user);
    }

    @Override
    @Transactional
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    @Override
    public User findByUserNameForAdmin(String username) {
        return userDao.findByUserNameForAdmin(username);
    }

    @Override
    @Transactional
    public User getById(UUID id) {
        return userDao.getById(id);
    }

    @Override
    @Transactional
    public User getByEmail(String email) {
        return userDao.getByEmail(email);
    }

    @Override
    @Transactional
    public Collection getAll() {
        return userDao.getAll();
    }

    @Override
    @Transactional
    public User edit(User user) {
        return userDao.edit(user);
    }

    @Override
    @Transactional
    public Collection<User> getSearchedUsers(String searchLine) {
        return userDao.getSearchedUsers(searchLine);
    }

    @Override
    @Transactional
    public User getPrincipalUser(){
        return userDao.getPrincipalUser();
    }
}