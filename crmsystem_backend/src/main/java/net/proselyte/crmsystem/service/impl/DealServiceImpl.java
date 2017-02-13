package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.DealDAO;
import net.proselyte.crmsystem.model.Deal;
import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.DealService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;
import java.util.logging.Logger;

@Service
public class DealServiceImpl implements DealService {

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
        try {
            Writer fileWriter = new BufferedWriter(new FileWriter(new File("D:\\crmsystem.txt")));
            fileWriter.write("inside dealserviceImpl.getAll()..");
            fileWriter.flush();
//            fileWriter.close();

            Collection<Deal> listDeals = new ArrayList<>();//this.dealDAO.getAll();
            fileWriter.write("inside dealserviceImpl.getAll()...list Deals: " + listDeals);
            fileWriter.flush();
            fileWriter.close();

            for (Deal deal : listDeals) {
                logger.info("List deals: " + deal);
            }

            return listDeals;
        } catch (IOException ioexc){
            ioexc.printStackTrace();
            return null;
        }

    }

    @Override
    @Transactional
    public void save(Deal deal) {
        this.dealDAO.save(deal);
        logger.info("Deal saved. Details: " + deal);
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


}
