package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.dao.CommentDAO;
import net.proselyte.crmsystem.model.Comment;
import net.proselyte.crmsystem.service.CommentService;
import net.proselyte.crmsystem.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

/**
 * Implementation of {@link CompanyService} interface.
 *
 * @author Leonid Dubravsky
 */

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentDAO commentDAO;

    @Override
    @Transactional
    public Comment getById(UUID id) {
        return commentDAO.getById(id);
    }

    @Override
    @Transactional
    public Collection<Comment> getAll() {
        return commentDAO.getAll();
    }

    @Override
    @Transactional
    public Collection<Comment> getForEntity(UUID id) {
        return commentDAO.getForEntity(id);
    }

    @Override
    @Transactional
    public void save(Comment comment) {
        commentDAO.save(comment);
    }

    @Override
    @Transactional
    public void remove(Comment comment) {
        commentDAO.remove(comment);
    }
}
