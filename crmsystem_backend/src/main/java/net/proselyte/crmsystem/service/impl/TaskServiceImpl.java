package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.TaskDAO;
import net.proselyte.crmsystem.model.Task;
import net.proselyte.crmsystem.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link TaskService}.
 *
 * @author Vladimir Vitlickij
 */
@Service
public class TaskServiceImpl implements TaskService{

    @Autowired
    TaskDAO taskDAO;

    @Override
    @Transactional
    public Task getById(UUID id) {
        return taskDAO.getById(id);
    }

    @Override
    @Transactional
    public Collection<Task> getAll() {
        return taskDAO.getAll();
    }

    @Override
    @Transactional
    public void save(Task task) {
        taskDAO.save(task);
    }

    @Override
    @Transactional
    public void remove(Task task) {
        taskDAO.remove(task);
    }

    @Override
    @Transactional
    public Task edit(Task task) {
       return taskDAO.edit(task);
    }
}
