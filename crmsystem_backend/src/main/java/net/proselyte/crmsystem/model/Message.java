package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Simple JavaBean domain object that represents a MessageDAO.
 *
 * @author Leonid Dubravsky
 */

@Entity
@Table(name = "messages")
public class Message extends BaseEntity{

    @Column(name = "text")
    private String text;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private User author;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "recipient_id", referencedColumnName = "id")
    private User recipient;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created")
    private Date created;

    @Column(name = "status")
    private boolean status;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
