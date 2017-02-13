package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.DealStatus;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.DealStatusService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "deal/remove", method = RequestMethod.GET)
    public String removeDeal(@PathVariable("id") UUID id, Model model){
        this.dealService.remove(this.dealService.getById(id));
        return "redirect:/deal";
    }

    @RequestMapping(value = "/deal/add/", method = RequestMethod.GET)
    public String addDeal(Model model) {
        Deal tempdeal = new Deal();
        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
//        tempdeal.setCreated(new java.util.Date().getTime());//java.sql.Timestamp(now.getTime()));
        tempdeal.setDealStatus(new DealStatus());

        model.addAttribute("deal", tempdeal);
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("dealStatus", this.dealStatusService.getAll());
        model.addAttribute("selectedUser", new User());
        model.addAttribute("selectedDealStatus", new DealStatus());
        return "deal/dealadd";
    }

    @RequestMapping(value = "/deal/addDealUser/", method = RequestMethod.POST)
    public String addDealUser(@ModelAttribute ("selectedUser") User selectedUser,
                          @ModelAttribute ("selectedDealStatus") DealStatus dealStatus) {
        try {

            Writer writer = new FileWriter(new File("D:\\DealController.txt"));
            writer.write("inside dealController addUser..\r\n" + selectedUser);
            writer.flush();
            writer.close();
            return "deals";//dealadd";
        } catch (Exception e){
            e.printStackTrace();
            return "deals";
        }
    }


    @RequestMapping(value = "deal/add/", method = RequestMethod.POST)
    public String addDeal(@ModelAttribute Deal deal, Model model){

        this.dealService.save(deal);
        return "redirect:/deal";
    }
}
