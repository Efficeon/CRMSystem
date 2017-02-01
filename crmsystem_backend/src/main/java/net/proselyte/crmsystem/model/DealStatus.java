package net.proselyte.crmsystem.model;


import javax.persistence.*;
import java.util.List;

/**
 * Model class {@link net.proselyte.crmsystem.model.DealStatus}.
 *
 * @author Serhiy Zamikhovskyy
 */



@Entity
@Table(name = "dealstatus")
public class DealStatus extends NamedEntity{

    @OneToMany(mappedBy = "dealstatusid")
    private List<Deal> dealList;

    void addDeal(Deal deal){
        this.dealList.add(deal);
        if(deal.getDealStatus() != this){
            deal.setDealStatus(this);
        }
    }

    List<Deal> getDeals(){
        return this.dealList;
    }

    @Override
    public String toString() {
        return "DealStatus:" + super.toString() +
                "dealList=" + dealList +
                '}';
    }
}
