package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="contact")
public class Contact extends BaseEntity {

    @Column(name="company")
    private String company;

    @Column(name="responsibleUser")
    private String responsibleUsery;

    @Column(name="name")
    private String name;

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

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getResponsibleUsery() {
        return responsibleUsery;
    }

    public void setResponsibleUsery(String responsibleUsery) {
        this.responsibleUsery = responsibleUsery;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Contact contact = (Contact) o;

        if (company != null ? !company.equals(contact.company) : contact.company != null) return false;
        if (responsibleUsery != null ? !responsibleUsery.equals(contact.responsibleUsery) : contact.responsibleUsery != null)
            return false;
        if (name != null ? !name.equals(contact.name) : contact.name != null) return false;
        if (website != null ? !website.equals(contact.website) : contact.website != null) return false;
        if (skype != null ? !skype.equals(contact.skype) : contact.skype != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(contact.phoneNumber) : contact.phoneNumber != null) return false;
        if (createDate != null ? !createDate.equals(contact.createDate) : contact.createDate != null) return false;
        return updateDate != null ? updateDate.equals(contact.updateDate) : contact.updateDate == null;
    }

    /*@Override
    public int hashCode() {
        int result = company != null ? company.hashCode() : 0;
        result = 31 * result + (responsibleUsery != null ? responsibleUsery.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        result = 31 * result + (skype != null ? skype.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "company='" + company + '\'' +
                ", responsibleUsery='" + responsibleUsery + '\'' +
                ", name='" + name + '\'' +
                ", website='" + website + '\'' +
                ", skype='" + skype + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                '}';
    }*/
}
