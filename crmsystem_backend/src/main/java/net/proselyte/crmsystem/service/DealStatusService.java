package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.DealStatus;

import java.util.Collection;
import java.util.UUID;

/**
 * service interface of {@link net.proselyte.crmsystem.model.DealStatus} class.
 *
 * @author Serhiy Zamikhovskyy
 */

public interface DealStatusService {

    DealStatus getById(UUID id);
    Collection<DealStatus> getAll();
    void save(DealStatus entity);
    void remove(DealStatus entity);

}
