package net.proselyte.crmsystem.model;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.Set;

/**
 * Simple JavaBean domain object that represents Role of the {@link User}
 *
 * @author Eugene Suleimanov
 */

@Entity
@Table(name = "roles")
public class Role extends NamedEntity {

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;
}
