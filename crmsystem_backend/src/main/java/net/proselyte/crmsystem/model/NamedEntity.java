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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NamedEntity that = (NamedEntity) o;

        return name != null ? name.equals(that.name) : that.name == null;
    }

    @Override
    public int hashCode() {
        return name != null ? name.hashCode() : 0;
    }

    @Override
    public String toString() {
        return this.name;
    }
}
