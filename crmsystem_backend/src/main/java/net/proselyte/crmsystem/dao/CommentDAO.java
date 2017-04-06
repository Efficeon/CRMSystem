package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Comment;

import java.util.Collection;
import java.util.UUID;

/**
 * Created by lion on 25.03.17.
 */
public interface CommentDAO extends GenericDAO<Comment, UUID>{

    public Collection<Comment> getForEntity(UUID id);
}
