package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collection;
import java.util.List;

/**
 * Controller for class {@link net.proselyte.crmsystem\service\DealService.java}
 * Created by Serhiy Zamikhovskyy on 25.01.2017.
 */
@Controller
public class DealController {

    @Autowired
    DealService dealService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "deal", method = RequestMethod.GET)
    public String deals(Model model){
        Collection<Deal> listDeals = this.dealService.getAll();
        model.addAttribute("listDeals", listDeals);
        return "deal/deals";
    }

    @RequestMapping(value = "dealData/{id}", method = RequestMethod.GET)
    public String dealData(@PathVariable("id") Long id, Model model){
        Deal deal = this.dealService.getById(id);
        model.addAttribute("deal", deal);
        return "deal/dealData";
    }

    @RequestMapping(value = "deal/remove", method = RequestMethod.GET)
    public String removeDeal(@PathVariable("id") Long id, Model model){
        this.dealService.remove(this.dealService.getById(id));
        return "redirect:/deal";
    }

    @RequestMapping(value = "deal/addDeal", method = RequestMethod.POST)
    public String addDeal(@PathVariable("budget") Double budget, @PathVariable("responsibleUser")
            Long responsibleUserId){
        Deal tempdeal = new Deal();
        tempdeal.setBudget(budget);
        tempdeal.setResponsibleUser(this.userService.getById(responsibleUserId));
        this.dealService.save(tempdeal);
        return "redirect:/deal";
    }
}
