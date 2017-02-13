package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Deal;
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

import java.util.List;
import java.util.UUID;

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

    @RequestMapping(value = "dealstatus", method = RequestMethod.GET)
    public String listDealStatus(Model model){
        model.addAttribute("listDealStatuses", this.dealStatusService.getAll());
        return "dealstatus/dealstatuses";
    }

    @RequestMapping(value = "dealstatus/add/", method = RequestMethod.GET)
    public String addDealStatus(Model model){
        DealStatus tempDealStatus  = new DealStatus();
        model.addAttribute("dealstatus", tempDealStatus);
        model.addAttribute("dealList", this.dealService.getAll());
        return "/dealstatus/dealstatusesadd";
    }

    @RequestMapping(value = "dealstatus/add", method = RequestMethod.POST)
    public String addDealStatusData(@ModelAttribute ("dealstatus") DealStatus dealstatus,
//                                    @ModelAttribute ("deallist") List<Deal> deallist,
                                    Model model){

        this.dealStatusService.save(dealstatus);
        return "redirect:/dealstatus/";
    }

    @RequestMapping(value = "removedealstatus/{id}/", method = RequestMethod.GET)
    public String removeDealStatus(@PathVariable UUID id){
        this.dealStatusService.remove(this.dealStatusService.getById(id));
        return "redirect:/dealStatus/";
    }

    @RequestMapping(value = "/editDealStatus/{id}")
    public String editDealStatus(@PathVariable("id") UUID id, Model model){
        model.addAttribute("dealStatus", this.dealStatusService.getById(id));
        return "dealstatus/dealStatusesAdd";
    }

    @RequestMapping(value = "editDealStatus/{id}", method = RequestMethod.POST)
    public String editSubmit(@PathVariable("id") UUID id, @ModelAttribute DealStatus dealStatus){
        dealStatus.setId(id);

        this.dealStatusService.save(dealStatus);
        return "redirect:/dealStatus/";
    }



}
