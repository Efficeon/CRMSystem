package net.proselyte.crmsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for basic pages (About, Terms of Use, etc.)
 *
 * @author Eugene Suleimanov
 */

@Controller
public class BaseController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome() {
        return "welcome";
    }

    @RequestMapping(value = "aboutUs", method = RequestMethod.GET)
    public String aboutUs() {
        return "basic/aboutUs";
    }

    @RequestMapping(value = "aboutYou", method = RequestMethod.GET)
    public String aboutYou() {
        return "basic/aboutYou";
    }

    @RequestMapping(value = "howToStart", method = RequestMethod.GET)
    public String howToStart() {
        return "basic/howToStart";
    }

    @RequestMapping(value = "termsOfUse", method = RequestMethod.GET)
    public String termsOfUse() {
        return "basic/termsOfUse";
    }
}
