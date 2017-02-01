package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.DealStatus;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.DealStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for class {@link net.proselyte.crmsystem\service\DealStatusService.java}
 * Created by Serhiy Zamikhovskyy on 25.01.2017.
 */

@Controller
public class DealStatusController {

    @Autowired
    DealStatusService dealStatusService;

    @Autowired
    DealService dealService;

    @RequestMapping(value = "/dealStatuses", method = RequestMethod.GET)
    public String listDealStatus(Model model){
        model.addAttribute("listDealStatuses", this.dealStatusService.getAll());
        return "dealStatuses";
    }

    @RequestMapping(value = "dealStatuses/add", method = RequestMethod.GET)
    public String addDealStatus(Model model){
        DealStatus tempDealStatus  = new DealStatus();
        model.addAttribute("dealstatus", tempDealStatus);
        model.addAttribute("dealList", this.dealService.getAll());
        return "dealStatusesAdd";
    }

    @RequestMapping(value = "dealStatuses/add", method = RequestMethod.POST)
    public String addDealStatusData(@ModelAttribute DealStatus dealStatus){
        this.dealStatusService.save(dealStatus);
        return "redirect:/dealStatus/";
    }

    @RequestMapping(value = "removedealstatus/{id}/", method = RequestMethod.GET)
    public String removeDealStatus(@PathVariable Long id){
        this.dealStatusService.remove(this.dealStatusService.getById(id));
        return "redirect:/dealStatus/";
    }

    @RequestMapping(value = "/editDealStatus/{id}")
    public String editDealStatus(@PathVariable("id") Long id, Model model){
        model.addAttribute("dealStatus", this.dealStatusService.getById(id));
        return "dealstatus/dealStatusesAdd";
    }

    @RequestMapping(value = "editDealStatus/{id}", method = RequestMethod.POST)
    public String editSubmit(@PathVariable("id") Long id, @ModelAttribute DealStatus dealStatus){
        dealStatus.setId(id);

        this.dealStatusService.save(dealStatus);
        return "redirect:/dealStatus/";
    }



}
