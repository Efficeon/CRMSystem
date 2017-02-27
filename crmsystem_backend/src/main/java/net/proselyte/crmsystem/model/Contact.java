package net.proselyte.crmsystem.model;

/**
 * Simple JavaBean domain object that represents a Contact.
 *
 * @author Leonid Dubravsky
 */
import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name="contacts")
public class Contact extends NamedEntity {

    @Column(name="website")
    private String website;

    @Column(name="skype")
    private String skype;

    @Column(name="phone_number")
    private String phoneNumber;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_date")
    private Date createDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="update_date")
    private Date updateDate;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="contact_company", joinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"),
              inverseJoinColumns = @JoinColumn(name="company_id", referencedColumnName="id"))
    private Set<Company> associatedCompanies;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="contact_deal", joinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="deal_id", referencedColumnName="id"))
    private Set<Deal> associatedDeal;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinTable(name="contact_user", joinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="user_id", referencedColumnName="id"))
    private User responsibleUser;

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Set<Company> getAssociatedCompanies() {
            return associatedCompanies;
    }

    public void setAssociatedCompanies(Set<Company> associatedCompany) {
        this.associatedCompanies = associatedCompany;
    }

    public void setAssociatedCompanies(Company company) {
        this.associatedCompanies.add(company);
    }

    public Set<Deal> getAssociatedDeal() {
        return associatedDeal;
    }

    public void setAssociatedDeals(Set<Deal> associatedDeal) {
        this.associatedDeal = associatedDeal;
    }

    public void setAssociatedDeal(Deal associatedDeal) {
        this.associatedDeal.add(associatedDeal);
    }

    public void removeAssociatedDeal(Deal deal) {
        this.associatedDeal.remove(deal);
    }

    public void removeAssociatedCompanies() {
        this.associatedCompanies = null;
    }

    public void removeAssociatedCompany(Company company) {
        this.associatedCompanies.remove(company);
    }

    public User getResponsibleUser() {
        return responsibleUser;
    }

    public void setResponsibleUser(User responsibleUser) {
        this.responsibleUser = responsibleUser;
    }
}
