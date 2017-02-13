package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;

import java.util.Collection;
import java.util.UUID;

/**
 * Service interface for class {@link Deal}
 * Created by Serhiy Zamikhovskyy on 25.01.2017.
 */


public interface DealService {
    Deal getById(UUID id);

    Collection<Deal> getAll();

    void save(Deal deal);

    void remove(Deal deal);

    public Deal findByResponsibleUser(UUID id);


}
