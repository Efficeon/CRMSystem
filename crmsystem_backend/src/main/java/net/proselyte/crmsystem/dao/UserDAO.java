package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.User;

/**
 * Extension of {@link GenericDAO} interface for class {@link User}.
 *
 * @author Eugene Suleimanov
 */
public interface UserDAO extends GenericDAO<User, Long> {

    User findByUserName(String username);
}
