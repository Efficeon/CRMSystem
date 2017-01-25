package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.BaseEntity;

import java.util.Collection;
import java.util.UUID;

/**
 * Generic DAO interface. Used as a base interface for all DAO classes.
 *
 * @author Eugene Suleimanov
 */
public interface GenericDAO<T extends BaseEntity, ID> {

    T getById(ID id);

    Collection<T> getAll();

    void save(T entity);

    void remove(T entity);
}
