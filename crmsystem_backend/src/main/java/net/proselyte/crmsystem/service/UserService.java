package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.User;

import java.util.Collection;
import java.util.UUID;

/**
 * service class for {@link User}
 *
 * @author Eugene Suleimanov
 */

public interface UserService {

    void save(User user);

    void remove(User user);

    User findByUserName(String username);

    User getById(UUID id);

    Collection getAll();

    User edit(User user);

    Collection<User> getSearchedUsers(String searchLine);

    User getByEmail(String email);

    public User getPrincipalUser();
}
