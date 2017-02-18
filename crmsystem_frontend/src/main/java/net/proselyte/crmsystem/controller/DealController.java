package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.DealStatus;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.DealStatusService;
import net.proselyte.crmsystem.service.UserService;
import net.proselyte.crmsystem.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.*;

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

    @Autowired
    private DealStatusService dealStatusService;

    @RequestMapping(value = "deal", method = RequestMethod.GET)
    public String listDeals(Model model){
        model.addAttribute("deal", new Deal());
        model.addAttribute("listDeals", this.dealService.getAll());
        return "deal/deals";
    }

    @RequestMapping(value = "dealData/{id}", method = RequestMethod.GET)
    public String dealData(@PathVariable("id") UUID id, Model model){
        Deal deal = this.dealService.getById(id);
        model.addAttribute("deal", deal);
        return "deal/dealData";
    }

    @RequestMapping(value = "removedeal/{id}/")
    public String removeDeal(@PathVariable("id") UUID id){
        this.dealService.remove(this.dealService.getById(id));
        return "redirect:/deal";
    }

    @RequestMapping(value = "/deal/add/", method = RequestMethod.GET)
    public String addDeal(Model model) {
        Deal tempdeal = new Deal();
        //tempdeal.setDealStatus(this.dealStatusService.getById(java.util.UUID.fromString("10f940ce-dc2f-4f44-8723-264345da0d0d")));//new DealStatus());
        model.addAttribute("deal", tempdeal);
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("user", new User());
        model.addAttribute("dealStatusList", this.dealStatusService.getAll());
        model.addAttribute("selectedDealStatus", new DealStatus());
        return "deal/dealadd";
    }


    @RequestMapping(value = "deal/add/", method = RequestMethod.POST)
    public String submitDeal(@ModelAttribute("deal") Deal deal){//, @RequestParam("id") UUID id){
        //deal.setResponsibleUser(this.userService.getById(id));
        this.dealService.save(deal);
        return "redirect:/deal";
    }
}


