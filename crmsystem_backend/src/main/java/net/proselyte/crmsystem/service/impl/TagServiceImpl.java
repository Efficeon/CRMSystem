package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.TagDAO;
import net.proselyte.crmsystem.model.Tag;
import net.proselyte.crmsystem.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

/**
 * Implementation of {@link TagService} interface.
 *
 * @author Leonid Dubravsky
 */

@Service
public class TagServiceImpl implements TagService{

    @Autowired
    TagDAO tagDAO;

    @Override
    @Transactional
    public Tag getById(Long id) {
        return tagDAO.getById(id);
    }

    @Override
    @Transactional
    public Tag getByName(String name) {
        return tagDAO.getByName(name);
    }

    @Override
    @Transactional
    public Collection<Tag> getAll() {
        return tagDAO.getAll();
    }

    @Override
    @Transactional
    public void save(Tag tag) {
        tagDAO.save(tag);
    }

    @Override
    @Transactional
    public void remove(Tag tag) {
        tagDAO.remove(tag);
    }
}
