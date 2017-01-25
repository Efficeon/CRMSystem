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

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "tags")
    private Set<Company> linkedCompanies;

    public Set<Company> getLinkedCompanies() {
        return linkedCompanies;
    }

    public void setLinkedCompanies(Set<Company> linkedCompanies) {
        this.linkedCompanies = linkedCompanies;
    }
}
