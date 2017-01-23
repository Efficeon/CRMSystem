package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;

/**
 * Extension of {@link net.proselyte.crmsystem.dao.GenericDAO} interface for class {@link net.proselyte.crmsystem.model.Deal}.
 *
 * @author Serhiy Zamikhovskyy
 */
public interface DealDAO extends GenericDAO<Deal, Long> {
    Deal findByResponsibleUser(long id);

}