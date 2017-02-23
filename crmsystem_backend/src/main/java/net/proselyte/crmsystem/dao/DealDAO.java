package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Deal;


import java.util.Collection;
import java.util.UUID;

/**
 * Extension of {@link net.proselyte.crmsystem.dao.GenericDAO} interface for class {@link net.proselyte.crmsystem.model.Deal}.
 *
 * @author Serhiy Zamikhovskyy
 */
public interface DealDAO extends GenericDAO<Deal, UUID> {
    Deal findByResponsibleUser(UUID id);

    public Collection<Deal> getSortedDeals(String searchLine);
}