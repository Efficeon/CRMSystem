package net.proselyte.crmsystem.dao;

import java.util.Collection;

/**
 * Generic DAO interface. Used as a base interface for all DAO classes.
 *
 * @author Eugene Suleimanov
 */
public interface GenericDAO<T, ID> {

    T getById(ID id);

    Collection<T> getAll();

    void save(T entity);

    void remove(T entity);
}
