package net.proselyte.crmsystem.model;


import javax.persistence.*;
import java.util.Date;
import java.util.Set;

import org.hibernate.*;

@Entity
@Table(name = "deals")
public class Deal extends NamedEntity {

    @Column(name = "budget")
    private  double budget;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created")
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated")
    private Date updated;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinTable(name="deals_users", joinColumns = @JoinColumn(name="deal_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="user_id", referencedColumnName="id"))
    private User responsibleUser;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "dealstatusid")
    private DealStatus dealStatus;

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
//        if(!dealStatus.getDeals().contains(this)){
//            dealStatus.addDeal(this);
//        }
    }
}