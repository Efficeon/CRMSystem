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

//    @RequestMapping(value = "user", method = RequestMethod.GET)
//    public String listUsers(Model model) {
//        model.addAttribute("user", new User());
//        model.addAttribute("listUsers", this.userService.getAll());
//        return "user/users";
//    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("userList", this.userService.getAll());
        return "user/users-v";
    }

//    @RequestMapping(value = "userdata/${id}/", method = RequestMethod.GET)
//    public String userData(@PathVariable("id") UUID id, Model model){
//        model.addAttribute("user", this.userService.getById(id));
//        model.addAttribute("userList", this.userService.getAll());
//        model.addAttribute("company", this.companyService.getAll());
//        model.addAttribute("task", this.taskService.getAll());
//        model.addAttribute("role", this.roleService.getAll());
//
//        return "user/userdata";
//    }

    @RequestMapping(value="userdata/{id}/", method = RequestMethod.GET)
    public String taskData(@PathVariable("id") UUID id, Model model){
        model.addAttribute("user", this.userService.getById(id));
        return "user/userdata";
    }

    @RequestMapping(value = "remove_user/${id}/", method = RequestMethod.GET)
    public String removeUser(@PathVariable("id") UUID id){
        this.userService.remove(userService.getById(id));
        return "redirect:/user/";
    }

//      работаем с ссылочными данными, связанными с другими сущностями

//    Roles


//    Companies


//    Tasks

}