package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

/**
 * Simple JavaBean domain object that represents a Coment.
 *
 * @author Leonid Dubravsky
 */

@Entity
@Table(name = "comments")
public class Comment extends BaseEntity{

    @Column(name = "entityID")
    private UUID entityID;

    @Column(name = "primaryCommentID")
    private UUID primaryCommentID;

    @Column(name = "text")
    private String text;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User author;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "recipient_id", referencedColumnName = "id")
    private User recipient;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created")
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated")
    private Date updated;

    public UUID getEntityID() {
        return entityID;
    }

    public void setEntityID(UUID entityID) {
        this.entityID = entityID;
    }

    public UUID getPrimaryCommentID() {
        return primaryCommentID;
    }

    public void setPrimaryCommentID(UUID primaryCommentID) {
        this.primaryCommentID = primaryCommentID;
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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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
}
