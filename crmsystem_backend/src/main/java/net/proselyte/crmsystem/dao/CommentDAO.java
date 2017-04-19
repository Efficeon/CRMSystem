package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Comment;

import java.util.Collection;
import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link Comment}.
 *
 * @author Leonid Dubravsky
 */
public interface CommentDAO extends GenericDAO<Comment, UUID>{

    public Collection<Comment> getForEntity(UUID id);
}
