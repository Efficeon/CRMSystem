package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.DealStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(name = "/dealStatus", method = RequestMethod.GET)
    public String listDealStatus(Model model){
        model.addAttribute("listDealStatus", this.dealStatusService.getAll());
        return "listDealStatus";
    }

}
