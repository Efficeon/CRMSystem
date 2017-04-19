package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Message;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.MessageService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
        ArrayList<Message> messageList = (ArrayList<Message>) this.messageService.getDialogue(author, recipient);
        for (Message message : messageList){
            if (message.getRecipient().equals(userService.findByUserName(author))){
                message.setStatus(false);
                messageService.save(message);
            }
        }
        request.getSession().setAttribute("recipient", recipient);
        model.addAttribute("message", new Message());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("recipient", this.userService.findByUserName(recipient));
        model.addAttribute("messageList", messageList);

        return "message/personalMessages";
    }

    @RequestMapping(value = "/messageSend/", method = RequestMethod.POST)
    public String sendMessage(@ModelAttribute ("message") Message message,
                              HttpServletRequest request){
        User userAuthor = userService.getPrincipalUser();
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
        User userRecipient = userService.findByUserName((String)request.getSession().getAttribute("recipient"));
        ArrayList<Message> messageList = (ArrayList<Message>) this.messageService.getDialogue(userService.getPrincipalUser().getUsername(), userRecipient.getUsername());
        model.addAttribute("messageList", messageList);
        return "message/fragmentDialogue";
    }

    @RequestMapping(value = "/message/newMessages/", method = RequestMethod.GET)
    public String newMessages(Model model) {
        model.addAttribute("messageList", this.messageService.getNewMessage(userService.getPrincipalUser().getUsername()));
        return "message/buttonMessages";
    }

    @RequestMapping(value = "/message/listUsers/", method = RequestMethod.GET)
    public String listUsers(Model model) {
        Set<Message> newMessage = new LinkedHashSet<>(this.messageService.getNewMessage(userService.getPrincipalUser().getUsername()));
        Set<User> usersWithNewMessages = new LinkedHashSet<>();
        List<User> usersWithoutNewMessages = (List<User>) userService.getAll();
        for (Message message : newMessage){
            usersWithNewMessages.add(message.getAuthor());
        }

        for (User tempUser : usersWithNewMessages){
            usersWithoutNewMessages.remove(tempUser);
        }
        usersWithoutNewMessages.remove(userService.getPrincipalUser());
        Collections.sort(usersWithoutNewMessages, (o1, o2) -> o1.getUsername().compareTo(o2.getUsername()));
        model.addAttribute("newMessageUsers", usersWithNewMessages);
        model.addAttribute("listUsers", usersWithoutNewMessages);
        return "message/fragmentUsers";
    }
}
