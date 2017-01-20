package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Tag;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.TagService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.Id;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "company", method = RequestMethod.GET)
    public String listCompanies(Model model) {
        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", this.companyService.getAll());
        return "company/companies";
    }

    @RequestMapping(value="companydata/{id}/", method = RequestMethod.GET)
    public String companyData(@PathVariable("id") Long id, Model model){
        model.addAttribute("company", this.companyService.getById(id));
        return "company/companydata";
    }

    @RequestMapping("removecompany/{id}/")
    public String removeCompany(@PathVariable("id") Long id){
        this.companyService.remove(companyService.getById(id));
        return "redirect:/company/";
    }

    @RequestMapping(value = "/company/add/", method = RequestMethod.POST)
    public String companySubmit(@ModelAttribute Company company){
        this.companyService.save(company);
        return "redirect:/editcompany/"+company.getId()+"/";
    }

    @RequestMapping(value = "/company/add/", method = RequestMethod.GET)
    public String addCompany(Model model) {
        model.addAttribute("company", new Company());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("user", new User());
        model.addAttribute("tag", new Tag());
        return "company/companyadd";
    }

    @RequestMapping(value = "/editcompany/{id}")
    public String editCompany(@PathVariable("id") Long id, Model model){
        model.addAttribute("company", this.companyService.getById(id));
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("tag", new Tag());
        return "company/companyadd";
    }

    @RequestMapping(value = "/editcompany/{id}", method = RequestMethod.POST)
    public String editSubmit(@PathVariable("id") Long id,
                             @ModelAttribute Company company){
        company.setId(id);
        company.setResponsibleUser(this.companyService.getById(id).getResponsibleUser());
        this.companyService.save(company);
        return "redirect:/company/";
    }

    @RequestMapping(value = "/addresponsible/{userId}/{companyId}/", method = RequestMethod.GET)
    public String addResponsibleUser(@PathVariable("userId") Long userId,
                                     @PathVariable("companyId") Long companyId,
                                     @ModelAttribute Company company,
                                     Model model){
        company = this.companyService.getById(companyId);
        company.setResponsibleUser(this.userService.getById(userId));
        this.companyService.save(company);
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        model.addAttribute("tag", new Tag());
        return "company/companyadd";
    }

    @RequestMapping(value = "/addresponsible/{userId}/{companyId}/", method = RequestMethod.POST)
    public String addResponsibleUserSubmit(@PathVariable("companyId") Long companyId,
                                           @ModelAttribute Company company){
        company.setId(companyId);
        company.setResponsibleUser(this.companyService.getById(companyId).getResponsibleUser());
        this.companyService.save(company);
        return "redirect:/company/";
    }

    @RequestMapping(value = "/removeresponsible/{userId}/{companyId}/", method = RequestMethod.GET)
    public String removeResponsibleUser(@PathVariable("userId") Long userId,
                                     @PathVariable("companyId") Long companyId,
                                     @ModelAttribute Company company,
                                     Model model){
        company = this.companyService.getById(companyId);
        company.removeResponsibleUser(this.userService.getById(userId));
        this.companyService.save(company);
        model.addAttribute("tag", new Tag());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        return "company/companyadd";
    }

    @RequestMapping(value = "/removeresponsible/{userId}/{companyId}/", method = RequestMethod.POST)
    public String removeResponsibleUserSubmit(@PathVariable("companyId") Long companyId,
                                              @ModelAttribute Company company){
        company.setId(companyId);
        company.setResponsibleUser(this.companyService.getById(companyId).getResponsibleUser());
        this.companyService.save(company);
        return "redirect:/company/";
    }

    @RequestMapping(value = "removetag/{tagId}/{companyId}/", method = RequestMethod.POST)
    public String removeLinkedTag(@PathVariable("tagId") Long tagId,
                                  @PathVariable("companyId") Long companyId,
                                  @ModelAttribute Company company){
        company.setId(companyId);
        company.setTags(this.companyService.getById(companyId).getTags());
        this.companyService.save(company);
        return "redirect:/company/";
    }

    @RequestMapping(value = "/removetag/{tagId}/{companyId}/", method = RequestMethod.GET)
    public String removeLinkedTag(@PathVariable("tagId") Long tagId,
                                  @PathVariable("companyId") Long companyId,
                                  @ModelAttribute Company company,
                                  Model model){
        company = this.companyService.getById(companyId);
        company.removeTag(this.tagService.getById(tagId));
        this.companyService.save(company);
        model.addAttribute("tag", new Tag());
        model.addAttribute("listTags", this.tagService.getAll());
        model.addAttribute("listUsers", this.userService.getAll());
        model.addAttribute("company", this.companyService.getById(companyId));
        return "company/companyadd";
    }
}