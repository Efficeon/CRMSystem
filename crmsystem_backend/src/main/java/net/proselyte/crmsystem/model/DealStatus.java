package net.proselyte.crmsystem.model;


import javax.persistence.*;
import java.util.List;

/**
 * Model class {@link net.proselyte.crmsystem.model.DealStatus}.
 *
 * @author Serhiy Zamikhovskyy
 */



@Entity
@Table(name = "DealStatus")
public class DealStatus extends NamedEntity{

    @OneToMany(mappedBy = "dealStatus")
    private List<Deal> dealList;

    @Override
    public String toString() {
        return "DealStatus:" + super.toString() +
                "dealList=" + dealList +
                '}';
    }
}
