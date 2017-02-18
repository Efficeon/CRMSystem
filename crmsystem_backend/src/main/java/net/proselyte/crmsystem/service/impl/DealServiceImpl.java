package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.DealDAO;
import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.DealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;
import java.util.logging.Logger;

@Service
public class DealServiceImpl implements DealService {

    @Autowired
    DealDAO dealDAO;

    Logger logger;

    @Override
    @Transactional
    public Deal getById(UUID id) {
        Deal tempDeal = this.dealDAO.getById(id);
        logger.info("Getting deal. Details:" + tempDeal);
        return tempDeal;
    }

    @Override
    @Transactional
    public Collection<Deal> getAll() {

//        try {
//
//            Writer writer = new FileWriter(new File("D:\\DealServiceImpl.txt"));
//            writer.write("inside dealServiceImpl..\r\n");
//            writer.flush();
            Collection<Deal> listDeals = this.dealDAO.getAll();//new ArrayList<>();


//            if (listDeals == null) {
//                writer.write("listDeals = null!\r\n");
//                listDeals = new ArrayList<>();
//                writer.flush();
//                writer.close();
//            }

            for (Deal deal : listDeals) {
                logger.info("List deals: " + deal);
            }
            return listDeals;
//        } catch (IOException e) {
//            e.printStackTrace();
//            return null;
//        }

    }

    @Override
    @Transactional
    public void save(Deal deal) {
        this.dealDAO.save(deal);
//        logger.info("Deal saved. Details: " + deal);
    }

    @Override
    @Transactional
    public void remove(Deal deal) {
        this.dealDAO.remove(deal);
        logger.info("Deal removed. Details: " + deal);
    }

    @Override
    @Transactional
    public Deal findByResponsibleUser(UUID id) {
        Deal tempDeal = this.dealDAO.findByResponsibleUser(id);
        logger.info("Deal is found. Details: " + tempDeal);
        return tempDeal;
    }

    @Override
    public Collection<Deal> getSearchedDeals(String searchLine) {
        return dealDAO.getSortedDeals(searchLine);
    }
}
