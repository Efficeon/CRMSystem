package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;

import java.util.Collection;

/**
 * Service interface for class {@link Deal}
 * Created by Serhiy Zamikhovskyy on 25.01.2017.
 */


public interface DealService {
    Deal getById(Long id);

    Collection<Deal> getAll();

    void save(Deal deal);

    void remove(Deal deal);

    public Deal findByResponsibleUser(long id);


}
