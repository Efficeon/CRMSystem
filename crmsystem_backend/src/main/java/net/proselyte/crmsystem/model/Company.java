package net.proselyte.crmsystem.model;

/**
 * Simple JavaBean domain object that represents a Company.
 *
 * @author Leonid Dubravsky
 */

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "companies")
public class Company extends NamedEntity{

    @Column(name = "email")
    private String email;

    @Column(name = "website")
    private String website;

    @Column(name = "address")
    private String address;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created")
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated")
    private Date updated;

    @ManyToMany
    @JoinTable(name = "companies_users", joinColumns = {@JoinColumn(name = "company_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")})
    private Set<User> responsibleUser;

    public Company() {
        this.created = new Date();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Set<User> getResponsibleUser() {
        return responsibleUser;
    }

    public void setResponsibleUser(Set<User> responsibleUser) {
        this.responsibleUser = responsibleUser;
    }

    public void setResponsibleUser(User user) {
        this.responsibleUser.add(user);
    }

    public void removeResponsibleUser(User user) {
        this.responsibleUser.remove(user);
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
        Company other = (Company) obj;
        if (getId() != other.getId())
            return false;
        return true;
    }
}
