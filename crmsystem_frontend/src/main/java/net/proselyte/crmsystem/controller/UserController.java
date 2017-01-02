package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for {@link User}'s pages
 *
 * @author Eugene Suleimanov
 */

@Controller
public class UserController {
    @RequestMapping(value = {"home"}, method = RequestMethod.GET)
    public String welcome() {
        return "user/home";
    }


}