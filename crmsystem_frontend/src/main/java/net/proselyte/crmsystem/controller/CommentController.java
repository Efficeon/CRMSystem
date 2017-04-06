package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Comment;
import net.proselyte.crmsystem.service.CommentService;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

/**
 * Controller for {@link Comment}'s pages
 *
 * @author Leonid Dubravsky
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;

    @Autowired
    private DealService dealService;

    @RequestMapping(value = "commentadd/{dealId}/{authorName}", method = RequestMethod.POST)
    public String commentAdd(@PathVariable("dealId") UUID dealId,
                             @PathVariable("authorName") String authorName,
                             @ModelAttribute("comment") Comment comment) {

        comment.setEntityID(dealId);
        comment.setAuthor(this.userService.findByUserName(authorName));
        this.commentService.save(comment);
        return "redirect:/dealdata/"+ dealId + "/";
    }

    @RequestMapping(value = "removecomment/{commentId}/{dealId}")
    public String removeDeal(@PathVariable("commentId") UUID commentId,
                             @PathVariable("dealId") UUID dealId) {
        this.commentService.remove(this.commentService.getById(commentId));
        return "redirect:/dealdata/"+ dealId + "/";
    }

    @RequestMapping(value = "replycomment/{dealId}/{commentId}/{authorName}/{recipientName}", method = RequestMethod.POST)
    public String replyComment(@PathVariable("dealId") UUID dealId,
                               @PathVariable("commentId") UUID commentId,
                               @PathVariable("authorName") String authorName,
                               @PathVariable("recipientName") String recipientName,
                               @ModelAttribute("comment") Comment comment){
        comment.setEntityID(dealId);
        comment.setPrimaryCommentID(commentId);
        comment.setAuthor(this.userService.findByUserName(authorName));
        comment.setRecipient(this.userService.findByUserName(recipientName));
        this.commentService.save(comment);
        return "redirect:/dealdata/"+ dealId + "/";
    }

    @RequestMapping(value = "/editcomment/{dealId}/{commentId}", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute("comment") Comment comment,
                             @PathVariable("commentId") UUID commentId,
                             @PathVariable("dealId") UUID dealId) {
        Comment tempComment = this.commentService.getById(commentId);
        tempComment.setText(comment.getText());
        this.commentService.save(tempComment);
        return "redirect:/dealdata/"+ dealId + "/";
    }
}
