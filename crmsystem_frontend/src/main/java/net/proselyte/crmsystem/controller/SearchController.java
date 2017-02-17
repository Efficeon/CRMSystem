package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.CompanyService;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @RequestMapping(value="/search/{name}")
    public String Search(Model model, @PathVariable("name") String name) {
        System.out.println(name);
        List<Company> companies = (List<Company>) companyService.getAll();
        List<Company> searchCompanies = new LinkedList<>();
        for (Company company: companies){
            if(company.getName().contains(name)) {
                searchCompanies.add(company);
            }
        }
        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", searchCompanies);

        return "company/companies";
    }
}
