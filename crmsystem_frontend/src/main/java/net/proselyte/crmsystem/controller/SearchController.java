package net.proselyte.crmsystem.controller;

import com.google.gson.Gson;
import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Controller for search {@link User} {@link Company}, {@link Deal}'s and all objects;
 *
 * @author Leonid Dubravsky
 */

@Controller
public class SearchController {
    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @Autowired
    private DealService dealService;

    @RequestMapping(value = "/autocomplete/", method = RequestMethod.GET)
    public @ResponseBody
    String getTags(@RequestParam("term") String term)  {
        List<Company> companies = (List<Company>) companyService.getSearchedCompanies(term);
        List<User> users = (List<User>) userService.getSearchedUsers(term);

        List<String> itemsFound = new ArrayList<String>();
        for (Company company: companies){
                itemsFound.add(company.getName());
        }
        for (User user: users){
            itemsFound.add(user.getUsername());
        }

        return new Gson().toJson(itemsFound);
    }

    @RequestMapping(value="/search/companies/")
    public String SearchCompanies(Model model, @RequestParam(value = "searchLine", required = false) String searchLine) {
        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", this.companyService.getSearchedCompanies(searchLine));

        return "company/companies";
    }

    @RequestMapping(value="/search/users/")
    public String SearchUsers(Model model, @RequestParam(value = "searchLine", required = false) String searchLine) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.getSearchedUsers(searchLine));

        return "user/users";
    }

    @RequestMapping(value="/search/deals/")
    public String SearchDeals(Model model, @RequestParam(value = "searchLine", required = false) String searchLine) {
        model.addAttribute("deal", new Deal());
        model.addAttribute("listDeals", this.dealService.getSearchedDeals(searchLine));

        return "deal/deals";
    }

    @RequestMapping(value="/search/all/")
    public String SearchAll(Model model, @RequestParam(value = "searchLine", required = false) String searchLine) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.getSearchedUsers(searchLine));

        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", this.companyService.getSearchedCompanies(searchLine));
        return "search/search";
    }
}
