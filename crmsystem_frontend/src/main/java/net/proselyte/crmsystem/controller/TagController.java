package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Tag;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for {@link Tag}'s pages
 *
 * @author Leonid Dubravsky
 */

@Controller
public class TagController {

    @Autowired
    private TagService tagService;

    @Autowired
    private CompanyService companyService;


    @RequestMapping(value = "tag", method = RequestMethod.GET)
    public String listTags(Model model){
        model.addAttribute("tag", new Tag());
        model.addAttribute("listTags", this.tagService.getAll());
        return "tag/tags";
    }

    @RequestMapping(value = "/tagCreate/{companyId}/", method = RequestMethod.POST)
    public String tagCreate(@PathVariable("companyId") Long companyId,
                            @ModelAttribute Tag tag,
                            @ModelAttribute Company company) {
        this.tagService.save(tag);
        company = this.companyService.getById(companyId);
        company.setTags(tag);
        this.companyService.save(company);
        return "redirect:/editcompany/"+company.getId()+"/";
    }
}
