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
    @JoinColumn(name = "implementer")
    private User implementer;

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

    public User getImplementer() {
        return implementer;
    }

    public void setResponsiblePerson(User implementer) {
        this.implementer = implementer;
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
                "description ='" + description + '\'' +
                ", implementer =" + implementer +
                ", created =" + created +
                ", updated =" + updated +
                '}';
    }
}
