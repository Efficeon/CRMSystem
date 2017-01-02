package net.proselyte.crmsystem.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 * Base class that extends {@link BaseEntity} and adds property 'name'.
 * Used as a base class for all objects that need this property.
 *
 * @author Eugene Suleimanov
 */

@MappedSuperclass
public class NamedEntity extends BaseEntity {

    @Column(name = "name")
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return this.name;
    }
}
