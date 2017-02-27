package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.*;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.ContactService;
import net.proselyte.crmsystem.service.DealService;
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

    @Autowired
    private DealService dealService;

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
    public String contactSubmit(@ModelAttribute("contact") Contact contact){
        this.contactService.save(contact);
        return "redirect:/editcontact/"+contact.getId()+"/";
    }

    @RequestMapping(value = "/contact/add/{contactId}", method = RequestMethod.POST)
    public String companySubmit(@ModelAttribute("contact") Contact contact,
                                @PathVariable("contactId") UUID contactId){
        contact.setId(contactId);
        contact.setAssociatedCompanies(this.contactService.getById(contactId).getAssociatedCompanies());
        contact.setAssociatedDeals(this.contactService.getById(contactId).getAssociatedDeal());
        this.contactService.save(contact);
        return "redirect:/editcontact/"+contact.getId()+"/";
    }

    @RequestMapping(value = "/contact/add/", method = RequestMethod.GET)
    public String addContact(Model model) {
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("listDeals", this.dealService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("contact", new Contact());
        model.addAttribute("user", new User());
        return "contact/contactadd";
    }

    @RequestMapping(value = "/editcontact/{id}", method = RequestMethod.GET)
    public String editContact(@PathVariable("id") UUID id, Model model){
        model.addAttribute("contact", this.contactService.getById(id));
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listDeals", this.dealService.getAll());
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("user", new User());
        return "contact/contactadd";
    }

    @RequestMapping(value = "/addAssociatedCompany/{companyId}/{contactId}/", method = RequestMethod.GET)
    public String addTag(@PathVariable("companyId") UUID companyId,
                         @PathVariable("contactId") UUID contactId,
                         @ModelAttribute("contact") Contact contact,
                         Model model) {
        contact = this.contactService.getById(contactId);
        contact.setAssociatedCompanies(this.companyService.getById(companyId));
        this.contactService.save(contact);
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listDeals", this.dealService.getAll());
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("contact", this.contactService.getById(contactId));
        return "redirect:/editcontact/"+contact.getId()+"/";
    }

    @RequestMapping(value = "/associatedCompany/remove/{companyId}/{contactId}/", method = RequestMethod.GET)
    public String removeResponsibleUser(@PathVariable("contactId") UUID contactId,
                                        @PathVariable("companyId") UUID companyId,
                                        @ModelAttribute("contact") Contact contact,
                                        @ModelAttribute("company") Company company,
                                        Model model){
        contact = this.contactService.getById(contactId);
        contact.removeAssociatedCompany(this.companyService.getById(companyId));
        this.contactService.save(contact);
        model.addAttribute("contact", this.contactService.getById(contactId));
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listDeals", this.dealService.getAll());
        model.addAttribute("user", new User());

        return "redirect:/editcontact/"+contact.getId()+"/";
    }


    @RequestMapping(value = "/associatedDeal/add/{dealId}/{contactId}/", method = RequestMethod.GET)
    public String addAssociatedContact(@PathVariable("contactId") UUID contactId,
                                       @PathVariable("dealId") UUID dealId,
                                       @ModelAttribute("deal") Deal deal,
                                       @ModelAttribute("contact") Contact contact,
                                       Model model){
        contact = this.contactService.getById(contactId);
        contact.setAssociatedDeal(this.dealService.getById(dealId));
        this.contactService.save(contact);
        model.addAttribute("contact", this.contactService.getById(contactId));
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listDeals", this.dealService.getAll());
        model.addAttribute("user", new User());

        return "redirect:/editcontact/"+contact.getId()+"/";
    }

    @RequestMapping(value = "/associatedDeal/remove/{dealId}/{contactId}//", method = RequestMethod.GET)
    public String removeAssociatedContact(@PathVariable("contactId") UUID contactId,
                                          @PathVariable("dealId") UUID dealId,
                                          @ModelAttribute("deal") Deal deal,
                                          @ModelAttribute("Contact") Contact contact,
                                          Model model) {
        contact = this.contactService.getById(contactId);
        contact.removeAssociatedDeal(this.dealService.getById(dealId));
        this.contactService.save(contact);
        model.addAttribute("contact", this.contactService.getById(contactId));
        model.addAttribute("listCompanies", this.companyService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listDeals", this.dealService.getAll());
        model.addAttribute("user", new User());

        return "redirect:/editcontact/"+contact.getId()+"/";
    }
}