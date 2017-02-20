package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Task;

import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link Task}.
 *
 * @author Vladimir Vitlitski
 */
public interface TaskDAO extends GenericDAO<Task, UUID> {
    void edit(Task task);
}
