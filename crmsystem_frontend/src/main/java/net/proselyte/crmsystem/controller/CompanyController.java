package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Company;
import net.proselyte.crmsystem.service.CompanyService;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

/**
 * Controller for {@link Company}'s pages
 *
 * @author Leonid Dubravsky
 */

@Controller
public class CompanyController {

    private CompanyService companyService;

    @Autowired(required = true)
    public void setCompanyService(CompanyService companyService){
        this.companyService = companyService;
    }

    @RequestMapping(value = "company", method = RequestMethod.GET)
    public String listCompanies(Model model) {
        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", this.companyService.getAll());
        return "company/companies";
    }

    @RequestMapping("companydata/{id}")
    public String companyData(@PathVariable("id") Long id, Model model){
        model.addAttribute("company", this.companyService.getById(id));
        return "company/companydata";
    }

    @RequestMapping("removecompany/{id}")
    public String removeCompany(@PathVariable("id") Long id){
        this.companyService.remove(companyService.getById(id));
        return "redirect:/company";
    }
}
