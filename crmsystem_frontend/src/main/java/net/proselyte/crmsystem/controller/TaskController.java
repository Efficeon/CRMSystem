package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Task;
import net.proselyte.crmsystem.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for {@link Task}'s pages.
 *
 * @author Vladimir Vitlickij.
 */

@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "task", method = RequestMethod.GET)
    public String listTasks(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.getAll());
        return "task/tasks";
    }

    @RequestMapping("taskdata/{id}")
    public String taskData(@PathVariable("id") Long id, Model model){
        model.addAttribute("task", this.taskService.getById(id));
        return "task/taskdata";
    }

    @RequestMapping("removetask/{id}")
    public String removeTask(@PathVariable("id") Long id){
        this.taskService.remove(taskService.getById(id));
        return "redirect:/task";
    }

    @RequestMapping(value = "/task/add", method = RequestMethod.POST)
    public String taskSubmit(@ModelAttribute Task task){
        this.taskService.save(task);
        return "redirect:/task";
    }

    @RequestMapping(value = "/task/add", method = RequestMethod.GET)
    public String addTask(Model model) {
        model.addAttribute("task", new Task());
        return "task/taskadd";
    }

}
