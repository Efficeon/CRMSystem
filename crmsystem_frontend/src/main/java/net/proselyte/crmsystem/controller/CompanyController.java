package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Tag;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.model.UserStatus;
import net.proselyte.crmsystem.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * Controller for {@link Company}'s pages
 *
 * @author Leonid Dubravsky
 */

@Controller
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @Autowired
    private TagService tagService;

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "company", method = RequestMethod.GET)
    public String listCompanies(Model model) {
        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", this.companyService.getAll());
        return "company/companies";
    }

    @RequestMapping(value = "companydata/{id}/", method = RequestMethod.GET)
    public String companyData(@PathVariable("id") UUID id, Model model) {
        model.addAttribute("company", this.companyService.getById(id));
        return "company/companydata";
    }

    @RequestMapping(value = "removecompany/{id}/", method = RequestMethod.GET)
    public String removeCompany(@PathVariable("id") UUID id) {
        this.companyService.remove(companyService.getById(id));
        return "redirect:/company/";
    }

    @RequestMapping(value = "/company/add/", method = RequestMethod.POST)
    public String companySubmit(@ModelAttribute("company") Company company) {
        this.companyService.save(company);
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/company/add/{companyId}", method = RequestMethod.POST)
    public String companySubmit(@ModelAttribute("company") Company company,
                                @PathVariable("companyId") UUID companyId) {
        company.setId(companyId);
        company.setResponsibleUser(this.companyService.getById(companyId).getResponsibleUser());
        company.setAssociatedContacts(this.companyService.getById(companyId).getAssociatedContacts());
        company.setTags(this.companyService.getById(companyId).getTags());
        this.companyService.save(company);
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/company/add/", method = RequestMethod.GET)
    public String addCompany(Model model) {
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("userStatus", UserStatus.values());
        model.addAttribute("company", new Company());
        model.addAttribute("user", new User());
        model.addAttribute("tag", new Tag());
        return "company/companyadd";
    }

    @RequestMapping(value = "/editcompany/{id}", method = RequestMethod.GET)
    public String editCompany(@PathVariable("id") UUID id,
                              Model model) {
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("company", this.companyService.getById(id));
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("tag", new Tag());
        return "company/companyadd";
    }

    @RequestMapping(value = "/editcompany/{id}", method = RequestMethod.POST)
    public String editSubmit(@PathVariable("id") UUID id,
                             @ModelAttribute Company company) {
        company.setId(id);
        company.setResponsibleUser(this.companyService.getById(id).getResponsibleUser());
        this.companyService.save(company);
        return "redirect:/company/";
    }

    @RequestMapping(value = "/addresponsible/{userId}/{companyId}/", method = RequestMethod.GET)
    public String addResponsibleUser(@PathVariable("userId") UUID userId,
                                     @PathVariable("companyId") UUID companyId,
                                     @ModelAttribute("company") Company company,
                                     Model model) {
        company = this.companyService.getById(companyId);
        company.setResponsibleUser(this.userService.getById(userId));
        this.companyService.save(company);
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        model.addAttribute("tag", new Tag());
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/removeresponsible/{userId}/{companyId}/", method = RequestMethod.GET)
    public String removeResponsibleUser(@PathVariable("userId") UUID userId,
                                        @PathVariable("companyId") UUID companyId,
                                        @ModelAttribute("company") Company company,
                                        Model model) {
        company = this.companyService.getById(companyId);
        company.removeResponsibleUser(this.userService.getById(userId));
        this.companyService.save(company);
        model.addAttribute("tag", new Tag());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/addAssociatedContact/{contactId}/{companyId}/", method = RequestMethod.GET)
    public String addAssociatedContact(@PathVariable("contactId") UUID contactId,
                                       @PathVariable("companyId") UUID companyId,
                                       @ModelAttribute("company") Company company,
                                       Model model) {
        company = this.companyService.getById(companyId);
        company.setAssociatedContact(this.contactService.getById(contactId));
        this.companyService.save(company);
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        model.addAttribute("tag", new Tag());
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/removeAssociatedContact/{contactId}/{companyId}/", method = RequestMethod.GET)
    public String removeAssociatedContact(@PathVariable("contactId") UUID contactId,
                                          @PathVariable("companyId") UUID companyId,
                                          @ModelAttribute("company") Company company,
                                          Model model) {
        company = this.companyService.getById(companyId);
        company.removeAssociatedContact(this.contactService.getById(contactId));
        this.companyService.save(company);
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/tagCreate/{companyId}/", method = RequestMethod.POST)
    public String addTag(@PathVariable("companyId") UUID companyId,
                         @ModelAttribute("tag") Tag tag,
                         @ModelAttribute("company") Company company) {
        List<Tag> allTag = (List<Tag>) this.tagService.getAll();
        for (Tag tempTag : allTag) {
            if (tempTag.getName().equals(tag.getName())) {
                tag = tempTag;
            }
        }
        this.tagService.save(tag);
        company = this.companyService.getById(companyId);
        company.setTags(tag);
        this.companyService.save(company);
        return "redirect:/editcompany/" + company.getId() + "/";
    }

    @RequestMapping(value = "/removetag/{tagId}/{companyId}/", method = RequestMethod.GET)
    public String removeLinkedTag(@PathVariable("tagId") UUID tagId,
                                  @PathVariable("companyId") UUID companyId,
                                  @ModelAttribute("company") Company company,
                                  Model model) {
        company = this.companyService.getById(companyId);
        company.removeTag(this.tagService.getById(tagId));
        this.companyService.save(company);
        model.addAttribute("tag", new Tag());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listContacts", this.contactService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        return "redirect:/editcompany/" + company.getId() + "/";
    }
}