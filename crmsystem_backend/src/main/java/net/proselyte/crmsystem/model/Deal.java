package net.proselyte.crmsystem.model;


import javax.persistence.*;
import java.util.Date;
import java.util.Set;

import org.hibernate.*;

@Entity
@Table(name = "Deals")
public class Deal extends BaseEntity {

    @Column(name = "budget")
    private  double budget;

    @Column(name = "created")
    private Date created;

    @Column(name = "updated")
    private Date updated;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinTable(name="deal_user", joinColumns = @JoinColumn(name="deal_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="user_id", referencedColumnName="id"))
    private User responsibleUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dealStatusId")
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
        if(!dealStatus.getDeals().contains(this)){
            dealStatus.addDeal(this);
        }
    }
}