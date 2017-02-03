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

    public void setImplementer(User implementer) {
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        Task task = (Task) o;

        if (!description.equals(task.description)) return false;
        if (!implementer.equals(task.implementer)) return false;
        if (!created.equals(task.created)) return false;
        return updated.equals(task.updated);

    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + description.hashCode();
        result = 31 * result + implementer.hashCode();
        result = 31 * result + created.hashCode();
        result = 31 * result + updated.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Task{" +
                "description='" + description + '\'' +
                ", implementer=" + implementer +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
