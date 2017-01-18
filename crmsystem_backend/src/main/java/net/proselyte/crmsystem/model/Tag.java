package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Set;

/**
 * Simple JavaBean domain object that represents a Tag.
 *
 * @author Leonid Dubravsky
 */

@Entity
@Table(name = "tags")
public class Tag extends NamedEntity{

    @ManyToMany(mappedBy = "tags")
    private Set<Company> linkedCompanies;

    public Set<Company> getLinkedCompanies() {
        return linkedCompanies;
    }

    public void setLinkedCompanies(Set<Company> linkedCompanies) {
        this.linkedCompanies = linkedCompanies;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = (int) (prime * result + this.getId());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Tag other = (Tag) obj;
        if (getId() != other.getId())
            return false;
        return true;
    }
}
