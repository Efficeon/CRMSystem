package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Role;
import net.proselyte.crmsystem.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for Admin's pages (list of users, project management, etc.)
 *
 * @author Eugene Suleimanov
 */

@Controller
public class AdminController {

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "admin/adminHome";
    }

    @RequestMapping(value = "/admin/listRoles", method = RequestMethod.GET)
    public String listRoles(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("listRoles", this.roleService.getAll());

        return "admin/role/listRoles";
    }
}
