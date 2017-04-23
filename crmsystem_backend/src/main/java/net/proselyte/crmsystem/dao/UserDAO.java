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

    User findByUserNameForAdmin(String username);

    User edit(User user);

    Collection<User> getSearchedUsers(String searchLine);

    User getByEmail(String email);

    public User getPrincipalUser();
}
