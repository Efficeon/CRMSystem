package net.proselyte.crmsystem.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;

import java.util.UUID;

/**
 * Base class that contains property 'id'.
 * Used as a base class for all objects that need this property.
 *
 * @author Eugene Suleimanov
 */

@MappedSuperclass
public class BaseEntity {

    @Id
    @GenericGenerator(name = "uuid-gen", strategy = "org.hibernate.id.UUIDGenerator")
    @GeneratedValue(generator = "uuid-gen")
    @Type(type="pg-uuid")
    @JsonIgnore
    private UUID id;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public boolean isNew() {
        return (this.id == null);
    }
}
