package net.proselyte.crmsystem.model;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * Simple JavaBean domain object that represents a Task.
 *
 * @author Vladimir Vitlickij
 */

@Entity
@Table(name = "tasks")
public class Task extends NamedEntity{

    @Column(name = "description")
    private String description;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = User.class)
    @JoinColumn(name = "responsible_user")
    private User responsUser;

    @Temporal(TemporalType.DATE)
    @Column(name = "created")
    private Date created;

    @Temporal(TemporalType.DATE)
    @Column(name = "updated")
    private Date updated;

    public Task() {
        this.created = new Date();
        this.updated = new Date();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getResponsibleUser() {
        return responsUser;
    }

    public void setResponsibleUser(User responsUser) {
        this.responsUser = responsUser;
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

    @Override
    public String toString() {
        return "Task{" +
                "description='" + description + '\'' +
                ", responsibleUser=" + responsUser +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
