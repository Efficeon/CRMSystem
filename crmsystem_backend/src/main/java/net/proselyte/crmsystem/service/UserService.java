package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.User;

/**
 * service class for {@link User}
 *
 * @author Eugene Suleimanov
 */

public interface UserService {

    void save(User user);

    User findByUserName(String username);
}
