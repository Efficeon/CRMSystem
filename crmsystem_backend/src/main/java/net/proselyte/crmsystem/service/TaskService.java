package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Task;

import java.util.Collection;
import java.util.UUID;

/**
 * Service interface for class {@link Task}
 *
 * @author Vladimir Vitlickij
 */

public interface TaskService {

    Task getById(UUID id);

    Collection<Task> getAll();

    void save(Task task);

    void remove(Task task);

    Task edit(Task task);
}
