package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Contact;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.ContactService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

/**
 * Controller for {@link Contact}'s pages
 *
 * @author Leonid Dubravsky
 */
@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "contacts", method = RequestMethod.GET)
    public String listContact(Model model) {
        model.addAttribute("contact", new Contact());
        model.addAttribute("listContacts", this.contactService.getAll());
        return "contact/contacts";
    }

    @RequestMapping(value="contactdata/{id}/", method = RequestMethod.GET)
    public String contactData(@PathVariable("id") UUID id, Model model){
        model.addAttribute("contact", this.contactService.getById(id));
        return "contact/contactdata";
    }

    @RequestMapping("removecontact/{id}/")
    public String removeContact(@PathVariable("id") UUID id){
        this.contactService.remove(contactService.getById(id));
        return "redirect:/contacts/";
    }

    @RequestMapping(value = "/contact/add/", method = RequestMethod.POST)
    public String contactSubmit(@ModelAttribute("contact") Contact contact,
                                @RequestParam(name = "responsibleUser.id", required = false) UUID userId,
                                @RequestParam(name = "associatedCompany.id", required = false) UUID companyId,) {
        contact.setResponsibleUser(this.userService.getById(userId));
        contact.setAssociatedCompany(this.companyService.getById(companyId));
        this.contactService.save(contact);
        return "redirect:/editcontact/"+contact.getId()+"/";
    }

    @RequestMapping(value = "/contact/add/", method = RequestMethod.GET)
    public String addContact(Model model) {
        model.addAttribute("contact", new Contact());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("user", new User());
        model.addAttribute("tag", new Company());
        return "contact/contactadd";
    }

    @RequestMapping(value = "/editcontact/{id}")
    public String editContact(@PathVariable("id") UUID id, Model model){
        model.addAttribute("contact", this.contactService.getById(id));
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("company", new Company());
        return "contact/contactadd";
    }

    @RequestMapping(value = "/editcontact/{id}", method = RequestMethod.POST)
    public String editSubmit(@PathVariable("id") UUID id,
                             @RequestParam(name = "responsibleUser.id", required = false) UUID userId,
                             @RequestParam(name = "associatedCompany.id", required = false) UUID companyId,
                             @ModelAttribute Contact contact){
        contact.setId(id);
        contact.setResponsibleUser(this.userService.getById(userId));
        contact.setAssociatedCompany(this.companyService.getById(companyId));
        this.contactService.save(contact);
        return "redirect:/contacts/";
    }
}
