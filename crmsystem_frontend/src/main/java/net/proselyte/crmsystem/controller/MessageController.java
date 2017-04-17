package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Message;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.MessageService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Controller for {@link Message}'s pages
 *
 * @author Leonid Dubravsky
 */

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/messages", method = RequestMethod.GET)
    public String authorization(Model model) {
        model.addAttribute("userList", this.userService.getAll());
        return "message/messages";
    }

    @RequestMapping(value = "/message/personalMessages/{author}/{recipient}", method = RequestMethod.GET)
    public String personalMessages(@PathVariable("author") String author,
                                   @PathVariable("recipient") String recipient,
                                   HttpServletRequest request,
                                   Model model) {
        request.getSession().setAttribute("author", author);
        request.getSession().setAttribute("recipient", recipient);
        model.addAttribute("message", new Message());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("recipient", this.userService.findByUserName(recipient));
        model.addAttribute("messageList", this.messageService.getDialogue(author, recipient));
        System.out.println("LIST "+this.messageService.getDialogue(author, recipient));
        return "message/personalMessages";
    }

    @RequestMapping(value = "/messageSend/", method = RequestMethod.POST)
    public String sendMessage(@ModelAttribute ("message") Message message,
                              HttpServletRequest request){
        User userAuthor = userService.findByUserName((String)request.getSession().getAttribute("author"));
        User userRecipient = userService.findByUserName((String)request.getSession().getAttribute("recipient"));
        message.setAuthor(userAuthor);
        message.setRecipient(userRecipient);
        message.setStatus(true);
        messageService.save(message);
        return "redirect:/message/personalMessages/"+userAuthor.getUsername()+"/"+userRecipient.getUsername();
    }

    @RequestMapping(value = "/message/personalMessages/", method = RequestMethod.GET)
    public String personalMessages(HttpServletRequest request,
                                   Model model) {
        User userAuthor = userService.findByUserName((String)request.getSession().getAttribute("author"));
        User userRecipient = userService.findByUserName((String)request.getSession().getAttribute("recipient"));
        model.addAttribute("messageList", this.messageService.getDialogue(userAuthor.getUsername(), userRecipient.getUsername()));
        return "message/fragment";
    }

    @RequestMapping(value = "/message/newMessages/", method = RequestMethod.GET)
    public String newMessages(Model model) {
        System.out.println("BUTTON");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);
        Object principal = authentication.getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        User user = userService.findByUserName(username);
        model.addAttribute("messageList", this.messageService.getNewMessage(user.getUsername()));
        return "message/buttonMessages";
    }
}
