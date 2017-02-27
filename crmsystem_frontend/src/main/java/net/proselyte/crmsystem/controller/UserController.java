package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.RoleService;
import net.proselyte.crmsystem.service.TaskService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashSet;
import java.util.Set;
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
    public String listUsers(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("roleList", this.roleService.getAll());
        model.addAttribute("taskList", this.taskService.getAll());
        model.addAttribute("companyList", this.companyService.getAll());

        return "user/users-v";
    }

    @RequestMapping(value = "userdata/{id}/", method = RequestMethod.GET)
    public String taskData(@PathVariable("id") UUID id,
                           @ModelAttribute("user") User user,
                           Model model) {
        model.addAttribute("user", this.userService.getById(id));
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("roleList", this.roleService.getAll());
        model.addAttribute("taskList", this.taskService.getAll());
        model.addAttribute("companyList", this.companyService.getAll());
        return "user/userdata";
    }

    @RequestMapping(value = "remove_user/${id}/", method = RequestMethod.GET)
    public String removeUser(@PathVariable("id") UUID id) {
        this.userService.remove(userService.getById(id));
        return "redirect:/user/";
    }





    @RequestMapping(value = "/edituser/{id}/", method = RequestMethod.GET)
//    @RequestMapping(value = "/edittask/", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") UUID id,
//                           @RequestParam("newImplementer") User newImpl,
            Model model){
//                                                                  model.addAttribute("user", new User());
        model.addAttribute("user",this.userService.getById(id));
        model.addAttribute("setCompanies", this.companyService.getAll());
        model.addAttribute("listTasks", this.taskService.getAll());
        model.addAttribute("listRoles", this.roleService.getAll());
        Set<Company> companies = new HashSet<>();
        companies.add(this.companyService.);

        return "user/edituser";ser
    }

    @RequestMapping(value = "/edituser/{id}/", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute("user") User user){
//        task.setId(id);
        this.userService.edit(user);

//        return "redirect:/task/";
//        return "redirect:/edited/";
//        return "/taskedited/";
//        return "welcome";
        return "user/editeduser";
    }
}