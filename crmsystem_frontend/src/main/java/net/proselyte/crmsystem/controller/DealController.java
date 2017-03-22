package net.proselyte.crmsystem.controller;

import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.DealStatus;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.ContactService;
import net.proselyte.crmsystem.service.DealService;
import net.proselyte.crmsystem.service.DealStatusService;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Controller for class {@link net.proselyte.crmsystem\service\DealService.java}
 * Created by Serhiy Zamikhovskyy on 25.01.2017.
 */
@Controller
public class DealController {

    @Autowired
    private DealService dealService;

    @Autowired
    private UserService userService;

    @Autowired
    private DealStatusService dealStatusService;

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "deal", method = RequestMethod.GET)
    public String listDeals(Model model){
        model.addAttribute("deal", new Deal());
        model.addAttribute("listDeals", this.dealService.getAll());
        return "deal/deals";
    }

    @RequestMapping(value = "removedeal/{id}/")
    public String removeDeal(@PathVariable("id") UUID id){
        this.dealService.remove(this.dealService.getById(id));
        return "redirect:/deal";
    }

    @RequestMapping(value = "/deal/add/", method = RequestMethod.GET)
    public String addDeal(Model model) {
        model.addAttribute("deal", new Deal());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("user", new User());
        model.addAttribute("dealStatusList", this.dealStatusService.getAll());
        model.addAttribute("selectedDealStatus", new DealStatus());
        model.addAttribute("contactsList", this.contactService.getAll());
        return "deal/dealadd";
    }

    @RequestMapping(value = "deal/add/", method = RequestMethod.POST)
    public String submitDeal(@ModelAttribute("deal") Deal deal){
        this.dealService.save(deal);
        return "redirect:/deal";
    }

    @RequestMapping(value = "/editdeal/{id}", method = RequestMethod.GET)
    public String editDeal(@PathVariable ("id") UUID id, Model model){
        Deal tempdeal = this.dealService.getById(id);
        model.addAttribute("deal", tempdeal);
        model.addAttribute("dealStatusList", this.dealStatusService.getAll());
        model.addAttribute("selectedDealStatus", new DealStatus());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("contactsList", this.contactService.getAll());
        model.addAttribute("user", new User());
        return "/deal/dealadd";
    }

    @RequestMapping(value = "/editdeal/{id}/", method = RequestMethod.POST)
    public String editDeal(@ModelAttribute ("deal") Deal deal,
                           @PathVariable ("id") UUID id){
        deal.setAssociatedContacts(this.dealService.getById(id).getAssociatedContact());
        this.dealService.save(deal);
        return "redirect:/deal/";
    }

    @RequestMapping(value = "/associatedContact/add/{contactId}/{dealId}/", method = RequestMethod.GET)
    public String addAssociatedContact(@PathVariable("contactId") UUID contactId,
                                       @PathVariable("dealId") UUID dealId,
                                       @ModelAttribute("deal") Deal deal,
                                       Model model){
        deal = this.dealService.getById(dealId);
        deal.setAssociatedContact(this.contactService.getById(contactId));
        this.dealService.save(deal);

        model.addAttribute("deal", new Deal());
        model.addAttribute("dealStatusList", this.dealStatusService.getAll());
        model.addAttribute("selectedDealStatus", new DealStatus());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("contactsList", this.contactService.getAll());
        model.addAttribute("user", new User());
        return "redirect:/editdeal/"+ deal.getId() + "/";
    }

    @RequestMapping(value = "/associatedContact/remove/{contactId}/{dealId}/", method = RequestMethod.GET)
    public String removeAssociatedContact(@PathVariable("contactId") UUID contactId,
                                          @PathVariable("dealId") UUID dealId,
                                          @ModelAttribute("deal") Deal deal,
                                          Model model) {
        deal = this.dealService.getById(dealId);
        deal.removeAssociatedContact(this.contactService.getById(contactId));
        this.dealService.save(deal);
        model.addAttribute("deal", new Deal());
        model.addAttribute("dealStatusList", this.dealStatusService.getAll());
        model.addAttribute("selectedDealStatus", new DealStatus());
        model.addAttribute("userList", this.userService.getAll());
        model.addAttribute("contactsList", this.contactService.getAll());
        model.addAttribute("user", new User());
        return "redirect:/editdeal/" + deal.getId() + "/";
    }

    @RequestMapping(value = "/dealDataJson", method = RequestMethod.GET)
    public @ResponseBody
    String getDealDataJson()  {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm");
        List<Deal> deals = (List<Deal>) this.dealService.findByStatus("done");
        Collections.sort(deals, new Comparator<Deal>() {
            public int compare(Deal o1, Deal o2) {
                return dateFormat.format(o1.getUpdated()).compareTo(dateFormat.format(o2.getUpdated()));
            }
        });
        String dataJson = "[";
        for (Deal deal : deals){
            dataJson = dataJson + "{\"created\":\"" + dateFormat.format(deal.getUpdated())
                                + "\",\"budget\":" + deal.getBudget() + "},";
        }
        dataJson = dataJson.substring(0, dataJson.length()-1) + "]";
        return dataJson;
    }

    @RequestMapping(value = "/dealsChart", method = RequestMethod.GET)
    public String dealsChart(){
        return "deal/chartDoneDeals";
    }
}