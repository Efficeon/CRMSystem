package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Task;
import net.proselyte.crmsystem.service.TaskService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

/**
 * Controller for {@link Task}'s pages.
 *
 * @author Vladimir Vitlitskiy.
 */

@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "task", method = RequestMethod.GET)
    public String listTasks(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.getAll());
        return "task/tasks";
    }

    @RequestMapping(value="taskdata/{id}/", method = RequestMethod.GET)
    public String taskData(@PathVariable("id") UUID id, Model model){
        model.addAttribute("task", this.taskService.getById(id));
        return "task/taskdata";
    }

    @RequestMapping("removetask/{id}/")
    public String removeTask(@PathVariable("id") UUID id){
        this.taskService.remove(taskService.getById(id));
        return "redirect:/task/";
    }

    @RequestMapping(value = "/task/add/", method = RequestMethod.POST)
    public String taskSubmit(@ModelAttribute Task task){
        this.taskService.save(task);
        return "redirect:/edittask/"+task.getId()+"/";
    }

    @RequestMapping(value = "/task/add/", method = RequestMethod.GET)
    public String addTask(Model model) {
        model.addAttribute("task", new Task());
//        model.addAttribute("user", new User());
        model.addAttribute("listtasks", this.taskService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        return "task/taskadd";
    }

    @RequestMapping(value = "/edittask/{id}")
    public String editTask(@PathVariable("id") UUID id, Model model){
        model.addAttribute("task", this.taskService.getById(id));
        model.addAttribute("listUsers", this.userService.getAll());
        //model.addAttribute("user", new User());
        return "task/taskadd";
    }

    @RequestMapping(value = "/edittask/{id}", method = RequestMethod.POST)
    public String editSubmit(@PathVariable("id") UUID id,
                             @ModelAttribute Task task){
        task.setId(id);
        task.setImplementer(this.taskService.getById(id).getImplementer());
        this.taskService.save(task);
        return "redirect:/task/";
    }
}
