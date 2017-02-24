package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.User;

import java.util.Collection;
import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link User}.
 *
 * @author Eugene Suleimanov
 */
public interface UserDAO extends GenericDAO<User, UUID> {

    User findByUserName(String username);

    public Collection<User> getSortedUsers(String searchLine);
}
