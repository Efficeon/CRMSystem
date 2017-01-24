package net.proselyte.crmsystem.dao;

import java.util.Collection;
import java.util.UUID;

/**
 * Generic DAO interface. Used as a base interface for all DAO classes.
 *
 * @author Eugene Suleimanov
 */
public interface GenericDAO<T, ID> {

    T getById(UUID id);

    Collection<T> getAll();

    void save(T entity);

    void remove(T entity);
}
