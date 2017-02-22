package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.RoleService;
import net.proselyte.crmsystem.service.TaskService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

/**
 * Controller for {@link User}'s pages
 *
 * @author Eugene Suleimanov
 */

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    TaskService taskService;

    @Autowired
    CompanyService companyService;

    @Autowired
    RoleService roleService;

    @RequestMapping(value = {"home"}, method = RequestMethod.GET)
    public String welcome() {
        return "user/home";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("userList", this.userService.getAll());
        return "user/users";
    }

    @RequestMapping(value = "userdata/${id}/", method = RequestMethod.GET)
    public String userData(@PathVariable("id") UUID id, Model model){
        User user = this.userService.getById(id);
        model.addAttribute("user", user);
        model.addAttribute("tasks",this.taskService.getAll());
        model.addAttribute("companies", this.companyService.getAll());
        model.addAttribute("roles", this.roleService.getAll());
        return "user/userdata";
//        return "userdata";
    }

//    отработка userdata.jsp --- "User details"

//    удаляем user по id
//    после удаления текущего user -- переадресация на страницу List of Users (но уже без него)
    @RequestMapping(value = "remove_user/${id}/", method = RequestMethod.GET)
    public String removeUser(@PathVariable("id") UUID id){
        this.userService.remove(userService.getById(id));
        return "redirect:/user/";
    }

//      работаем с ссылочными данными, связанными с другими сущностями

//    Roles


//    Companies


//    Tasks


    @RequestMapping(value = "/edituser/{id}")
    public String editUser(@PathVariable("id") UUID id, Model model){
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("task", this.taskService.getById(id));
        model.addAttribute("listCompanies", this.companyService.getById(id));
        model.addAttribute("listRoles", this.roleService.getById(id));
        model.addAttribute("user", new User());
        return "task/taskadd";
    }
//
//    @RequestMapping(value = "/edituser/{id}", method = RequestMethod.POST)
//    public String editSubmit(@PathVariable("id") UUID id, User user){
//        user.setId(id);
//        user.setImplementer(this.taskService.getById(id).getImplementer());
//        this.taskService.save(task);
//        return "redirect:/task/";
//    }


//    @RequestMapping(value = "/addresponsible/{userId}/{taskId}/", method = RequestMethod.GET)
//    public String addResponsibleUser(@PathVariable("userId") UUID userId,
//                                     @PathVariable("taskId") UUID taskId,
//                                     @ModelAttribute Task task,
//                                     Model model){
//        task = this.taskService.getById(taskId);
//        /*ArrayList<User> usersTemp = (ArrayList<User>) this.userService.getAll();
//        for (User user : usersTemp){
//            if (task.getResponsibleUser().contains(user)){
//                usersTemp.remove(user);
//            }
//        }*/
//        task.setImplementer(this.userService.getById(userId));
//        this.taskService.save(task);
//        model.addAttribute("listTasks", this.userService.getAll());
//        model.addAttribute("task", this.taskService.getById(taskId));
//        return "task/taskadd";
//    }
//
//    @RequestMapping(value = "/addresponsible/{userId}/{taskId}/", method = RequestMethod.POST)
//    public String addResponsibleUserSubmit(@PathVariable("taskId") UUID taskId,
//                                           @ModelAttribute Task task){
//        task.setId(taskId);
//        task.setImplementer(this.taskService.getById(taskId).getResponsibleUser());
//        this.taskService.save(task);
//        return "redirect:/task/";
//    }
//
//    @RequestMapping(value = "/removeresponsible/{userId}/{taskId}/", method = RequestMethod.GET)
//    public String removeResponsibleUser(@PathVariable("userId") UUID userId,
//                                        @PathVariable("taskId") UUID taskId,
//                                        @ModelAttribute Task task,
//                                        Model model){
//        task = this.taskService.getById(taskId);
//        task.removeResponsibleUser(this.userService.getById(userId));
//        this.taskService.save(task);
//        model.addAttribute("listTasks", this.userService.getAll());
//        model.addAttribute("task", this.taskService.getById(taskId));
//
//        return "task/taskadd";
//    }
//
//
//    @RequestMapping(value = "/removeresponsible/{userId}/{taskId}/", method = RequestMethod.POST)
//    public String removeResponsibleUserSubmit(@PathVariable("taskId") UUID taskId,
//                                              @ModelAttribute Task task){
//        task.setId(taskId);
//        task.setResponsibleUser(this.taskService.getById(taskId).getResponsibleUser());
//        this.taskService.save(task);
//        return "redirect:/task/";
//    }
//

    //    //    "отработка" кнопки submit в "useradd.jsp" ???
////
//    @RequestMapping(value = "/user/add/", method = RequestMethod.POST)
//    public String userSubmit(@ModelAttribute User user){
//        this.userService.remove(user);
//        return "redirect:/edituser/"+ user.getId() +"/";
//    }

//    @RequestMapping(value = "/user/add/", method = RequestMethod.GET)
//    public String addTask(Model model) {
//        model.addAttribute("task", new Task());
//        model.addAttribute("user", new User());
//        model.addAttribute("listtasks", this.taskService.getAll());
//        model.addAttribute("listUsers", this.userService.getAll());
//        return "task/taskadd";
//    }
//
//    /**
//     * Adds a new task by delegating the processing to taskService.
//     * Displays a confirmation JSP page
//     * Добавляет новую персону через PersonService
//     * Показывает подтверждающую JSP
//     * @return  the name of the JSP page
//     */
//    @RequestMapping(value = "/task/add/", method = RequestMethod.POST)
//    public String taskSubmit(@RequestParam(name = "implementer.id") UUID userId,
//                             @ModelAttribute("task") Task task) {
////        task.setImplementer(this.userService.getById(userId));
//        this.taskService.save(task);
//                                                                  return "welcome";
//                                                                  return "redirect:/task/";
//                                                                  return "/task/taskmesseges";
//        return "redirect:/edittask/"+task.getId()+"/";
//        return "redirect:/task/";
//        return "redirect:/edittask/";
//
//      return "taskadded";
//    }
//
//
////    получаем по id объект task, добавляем в Model,
////    получаем Collection всех users - listUsers, добавляем в Model,
////    передаем для отображения во view useradd.jsp (User add)
//
//
}