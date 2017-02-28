package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Task;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.TaskService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

/**
 * Controller for {@link Task}'s pages.
 *
 * @author Vladimir Vitlitski
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
        model.addAttribute("listUsers", this.userService.getAll());
//        model.addAttribute("success", "Task " + this.taskService.getName() + " "+ user.getLastName() + " updated successfully");

        return "task/tasks";
    }

    @RequestMapping(value="/taskdata/{id}/", method = RequestMethod.GET)
    public String taskData(@PathVariable("id") UUID id, Model model){
        model.addAttribute("task", this.taskService.getById(id));
        return "task/taskdata";
    }



//    @RequestMapping(value = "remove/{id}/", method = RequestMethod.POST)
//    public String removeTask(@PathVariable("id") UUID id){
//        this.taskService.remove(this.taskService.getById(id));
//        return "welcome";
//    }


//    @RequestMapping(value = "removetask/{id}/", method = RequestMethod.GET)
//    public String removeTask(@PathVariable("id") UUID id,
//                             Model model){
//        model.addAttribute("task", this.taskService.getById(id));
//        return "task/confirmation";
//    }
//
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String removeTask(@PathVariable("id") UUID id){
        this.taskService.remove(this.taskService.getById(id));
        return "redirect:/task";
    }

    @RequestMapping(value = "/task/add/", method = RequestMethod.GET)
    public String addTask(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("user", new User());
        model.addAttribute("listTasks", this.taskService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        return "task/taskadd";
    }

    @RequestMapping(value = "/task/add/", method = RequestMethod.POST)
    public String taskSubmit(@RequestParam(name = "implementer.id") UUID userId,
                             @ModelAttribute("task") Task task) {
//        task.setImplementer(this.userService.getById(userId));
        this.taskService.save(task);
//        return "redirect:/edittask/"+task.getId()+"/";
//        return "redirect:/task/";
        return "task/taskadded";
    }

    @RequestMapping(value = "/edittask/{id}/", method = RequestMethod.GET)
    public String editTask(@PathVariable("id") UUID id,
                           Model model){
        model.addAttribute("task",this.taskService.getById(id));
        model.addAttribute("listUsers", this.userService.getAll());

        return "task/edittask";
    }

    @RequestMapping(value = "/edittask/{id}/", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute("task") Task task){
        this.taskService.edit(task);

//        return "welcome";
        return "task/editedtask";
    }
}
