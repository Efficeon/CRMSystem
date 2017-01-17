package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Student on 15.01.2017.
 */



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

}
