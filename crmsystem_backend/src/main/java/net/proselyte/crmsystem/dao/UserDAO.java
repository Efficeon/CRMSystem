package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.User;
import java.util.Collection;
import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link User}.
 *
 * @author Eugene Suleimanov,
 * @author Vladimir Vitlitskiy
 *
 */
public interface UserDAO extends GenericDAO<User, UUID> {

    User findByUserName(String username);

    User edit(User user);

    Collection<User> getSortedUsers(String searchLine);

    User getByEmail(String email);
}
