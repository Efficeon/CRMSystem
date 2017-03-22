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

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "companies_tags", joinColumns = {@JoinColumn(name = "company_id", referencedColumnName = "id")},
              inverseJoinColumns = {@JoinColumn(name = "tag_id", referencedColumnName = "id")})
    private Set<Tag> tags;

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="contact_company", joinColumns = @JoinColumn(name="company_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"))
    private Set<Contact> associatedContacts;

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

    public void removeTag(Tag tag) {
       this.tags.remove(tag);
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public void setTags(Tag tag){
        this.tags.add(tag);
    }

    public Set<Contact> getAssociatedContacts() {
        return associatedContacts;
    }

    public void setAssociatedContacts(Set<Contact> contact) {
        this.associatedContacts = contact;
    }

    public void setAssociatedContact(Contact contact) {
        this.associatedContacts.add(contact);
    }

    public void removeAssociatedContact(Contact contact) {
        this.associatedContacts.remove(contact);
    }
}
