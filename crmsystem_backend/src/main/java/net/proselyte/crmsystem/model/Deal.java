package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * Model class {@link net.proselyte.crmsystem.model.Deal}.
 *
 * @author Serhiy Zamikhovskyy
 */

@Entity
@Table(name = "deals")
public class Deal extends NamedEntity {

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created")
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated")
    private Date updated;

    @Column(name = "budget")
    private  double budget;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinTable(name="deals_users", joinColumns = @JoinColumn(name="deal_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="user_id", referencedColumnName="id"))
    private User responsibleUser;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "dealstatusid")
    private DealStatus dealStatus;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="contact_deal", joinColumns = @JoinColumn(name="deal_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"))
    private Set<Contact> associatedContact;

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
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

    public User getResponsibleUser() {
        return responsibleUser;
    }

    public void setResponsibleUser(User responsibleUser) {
        this.responsibleUser = responsibleUser;
    }

    public DealStatus getDealStatus() {
        return dealStatus;
    }

    public void setDealStatus(DealStatus dealStatus) {
        this.dealStatus = dealStatus;
    }

    public Set<Contact> getAssociatedContact() {
        return associatedContact;
    }

    public void setAssociatedContacts(Set<Contact> contact) {
        this.associatedContact = contact;
    }

    public void setAssociatedContact(Contact contact) {
        this.associatedContact.add(contact);
    }

    public void removeAssociatedContact(Contact contact) {
        this.associatedContact.remove(contact);
    }
}