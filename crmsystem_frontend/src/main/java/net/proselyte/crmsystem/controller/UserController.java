package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.model.UserStatus;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.RoleService;
import net.proselyte.crmsystem.service.TaskService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

/**
 * Controller for {@link User}'s pages
 *
 * @author Eugene Suleimanov,
 * @author Vladimir Vitlitskiy
 *
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
        User user = userService.findByUserName(userService.getPrincipalUser().getUsername());
        if (!user.getStatus().equals(UserStatus.ACTIVE)){
            SecurityContextHolder.clearContext();
            return "redirect:/login?error";
        }
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

    @RequestMapping(value = "/user/add/", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listRoles", this.roleService.getAll());
        model.addAttribute("listTasks", this.taskService.getAll());
        model.addAttribute("listCompanies", this.companyService.getAll());
        return "user/useradd";
    }

    @RequestMapping(value = "/user/add/", method = RequestMethod.POST)
    public String taskSubmit(@ModelAttribute("user") User user) {
        this.userService.save(user);
        return "user/useradded";
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

    @RequestMapping(value = "/remove_user/{id}/", method = RequestMethod.GET)
    public String removeUser(@PathVariable("id") UUID id) {
        this.userService.remove(userService.getById(id));
        return "user/removeduser";
    }

    @RequestMapping(value = "/edituser/{id}/", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") UUID id,
                            Model model){
        model.addAttribute("user",this.userService.getById(id));
        model.addAttribute("companyList", this.companyService.getAll());
        model.addAttribute("taskList", this.taskService.getAll());
        model.addAttribute("roleList", this.roleService.getAll());
        return "user/edituser";
    }

    @RequestMapping(value = "/edituser/{id}/", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute("user") User user){
        this.userService.edit(user);
        return "user/editeduser";
    }
}
