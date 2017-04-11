package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.MailerService;
import net.proselyte.crmsystem.service.SecurityService;
import net.proselyte.crmsystem.service.UserService;
import net.proselyte.crmsystem.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.NoResultException;
import java.util.UUID;

/**
 * Controller for pages connected with authentication (registration, forgot password, etc.)
 *
 * @author Eugene Suleimanov
 */

@Controller
public class AuthenticationController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private  SecurityService securityService;
    @Autowired
    private MailerService mailerService;

    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public String authorization(Model model) {
        model.addAttribute("userForm", new User());
        String pass = securityService.generatePassword();
        return "authentication/signUp";
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm,
                               BindingResult bindingResult) {
        userForm.setStatus("LOCKED");
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "authentication/signUp";
        }

        userService.save(userForm);
        userForm.setId(this.userService.findByUserName(userForm.getUsername()).getId());
        String email = "Hello, "+userForm.getUsername()+"\n" +
                "\n" +
                "To verify your account, please click on the link http://localhost:8088/userVerifier/"+userForm.getId()+ "\n" +
                "or enter the following code: "+userForm.getId()+" on the verification page CRMSystem http://localhost:8088/userVerifier/.\n" +
                "\n" +
                "With respect,\n" +
                "Administrator of CRMSystem.";
        String subjectEmail = "Registration in the CRM system";
        mailerService.sendMail(userForm.getEmail(), email, subjectEmail);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "authentication/login";
    }

    @RequestMapping(value = "/userVerifier", method = RequestMethod.GET)
    public String userVerifier(Model model){
        model.addAttribute("user", new User());
        return "authentication/userVerifier";
    }

    @RequestMapping(value = "/userVerifier/{code}", method = RequestMethod.GET)
    public String userVerifier(@PathVariable("code") String code){
        User user;
        try {
            UUID uuid= UUID.fromString(code);
            user = this.userService.getById(uuid);
        } catch (NoResultException e){
            return "redirect:/userVerifier/";
        } catch (IllegalArgumentException e){
            return "redirect:/userVerifier/";
        }
        user.setStatus("ACTIVE");
            this.userService.save(user);
            return "user/home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username/password is incorrect or user is locked.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "authentication/login";
    }

    @RequestMapping(value = "/passwordRecovery", method = RequestMethod.GET)
    public String generateNewPassword(){
        return "authentication/passwordRecovery";
    }

    @RequestMapping(value = "/passwordRecovery/{email:.+}", method = RequestMethod.GET)
    public String generateNewPassword(@PathVariable("email") String email){
        User user;
        String password = securityService.generatePassword();
        try {
            user = userService.getByEmail(email);
        } catch (NoResultException e){
            return "authentication/login";
        }

        user.setPassword(password);
        userService.save(user);

        String textEmail = "Hello, "+user.getUsername()+"\n" +
                "\n" +
                "your new password in CRMSystem: " + password + "\n" +
                "\n" +
                "You must change the password after you log in!\n" +
                "Administrator of CRMSystem.";
        String subjectEmail = "Password recovery in the CRMSystem";
        mailerService.sendMail(user.getEmail(), textEmail, subjectEmail);
        return "authentication/login";
    }
}
