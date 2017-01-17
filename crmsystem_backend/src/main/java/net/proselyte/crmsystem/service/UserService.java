package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.User;

import java.util.Collection;

/**
 * service class for {@link User}
 *
 * @author Eugene Suleimanov
 */

public interface UserService {

    void save(User user);

    User findByUserName(String username);

    User getById(Long id);

    Collection getAll();
}
