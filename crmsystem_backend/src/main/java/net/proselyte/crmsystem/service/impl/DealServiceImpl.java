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
        return tempDeal;
    }

    @Override
    @Transactional
    public Collection<Deal> getAll() {
        Collection<Deal> listDeals = this.dealDAO.getAll();
        return listDeals;
    }

    @Override
    @Transactional
    public void save(Deal deal) {
        this.dealDAO.save(deal);
    }

    @Override
    @Transactional
    public void remove(Deal deal) {
        this.dealDAO.remove(deal);
//        logger.info("Deal removed. Details: " + deal);
    }

    @Override
    @Transactional
    public Deal findByResponsibleUser(UUID id) {
        Deal tempDeal = this.dealDAO.findByResponsibleUser(id);
        logger.info("Deal is found. Details: " + tempDeal);
        return tempDeal;
    }

    @Override
    @Transactional
    public Collection<Deal> findByStatus(String dealStatus) {
        return dealDAO.findByStatus(dealStatus);
    }

    @Override
    @Transactional
    public Collection<Deal> getSearchedDeals(String searchLine) {
        return dealDAO.getSearchedDeals(searchLine);
    }
}
