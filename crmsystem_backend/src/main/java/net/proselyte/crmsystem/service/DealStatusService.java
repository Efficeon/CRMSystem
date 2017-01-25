package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.DealStatus;

import java.util.Collection;

/**
 * service interface of {@link net.proselyte.crmsystem.model.DealStatus} class.
 *
 * @author Serhiy Zamikhovskyy
 */

public interface DealStatusService {

    DealStatus getById(Long id);
    Collection<DealStatus> getAll();
    void save(DealStatus entity);
    void remove(DealStatus entity);

}
