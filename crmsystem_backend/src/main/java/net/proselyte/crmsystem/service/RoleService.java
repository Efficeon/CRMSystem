package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Role;

import java.util.Collection;
import java.util.UUID;

/**
 * Service interface for class {@link Role}.
 *
 * @author Eugene Suleimanov
 */
public interface RoleService {
    Role getById(UUID id);

    Collection<Role> getAll();

    void save(Role role);

    void remove(Role role);
}
