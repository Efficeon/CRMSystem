package net.proselyte.crmsystem.model;

/**
 * Simple JavaBean domain object that represents a Contact.
 *
 * @author Leonid Dubravsky
 */

import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.util.Date;

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

    @OneToOne(fetch=FetchType.EAGER)
    @JoinTable(name="contact_company", joinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"),
              inverseJoinColumns = @JoinColumn(name="company_id", referencedColumnName="id"))
    private Company associatedCompany = null;

    @OneToOne(fetch=FetchType.EAGER)
    @JoinTable(name="contact_user", joinColumns = @JoinColumn(name="contact_id", referencedColumnName="id"),
            inverseJoinColumns = @JoinColumn(name="user_id", referencedColumnName="id"))
    private User responsibleUser = null;

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

    public Company getAssociatedCompany() {
        return associatedCompany;
    }

    public void setAssociatedCompany(Company associatedСompany) {
        this.associatedCompany = associatedСompany;
    }

    public User getResponsibleUser() {
        return responsibleUser;
    }

    public void setResponsibleUser(User responsibleUser) {
        this.responsibleUser = responsibleUser;
    }
}
