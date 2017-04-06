package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Comment;

import java.util.Collection;
import java.util.UUID;

/**
 * Service interface for class {@link Comment}.
 *
 * @author Leonid Dubravsky
 */
public interface CommentService {

    Comment getById(UUID id);

    Collection<Comment> getAll();

    Collection<Comment> getForEntity(UUID id);

    void save(Comment comment);

    void remove(Comment comment);


}
