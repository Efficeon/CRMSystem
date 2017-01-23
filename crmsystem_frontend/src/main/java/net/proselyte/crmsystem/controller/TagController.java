package net.proselyte.crmsystem.controller;

import com.google.gson.Gson;
import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Tag;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    private CompanyService userService;


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
        List<Tag> allTag = (List<Tag>) this.tagService.getAll();
        for (Tag tempTag : allTag){
            if (tempTag.getName().equals(tag.getName())){
                tag = tempTag;
            }
        }
        this.tagService.save(tag);
        company = this.companyService.getById(companyId);
        company.setTags(tag);
        this.companyService.save(company);
        return "redirect:/editcompany/"+company.getId()+"/";
    }

    @RequestMapping(value = "/tags/", method = RequestMethod.GET)
    public @ResponseBody String getTags(@RequestParam("term") String term)  {
        List<Tag> tags = (List<Tag>) tagService.getAll();
        List<String> tagsName = new ArrayList<String>();
        for (Tag tag : tags){
            if(tag.getName().contains(term)) {
                tagsName.add(tag.getName());
            }
        }
        return new Gson().toJson(tagsName);
    }
}
