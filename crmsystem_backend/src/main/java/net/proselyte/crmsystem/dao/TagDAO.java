package net.proselyte.crmsystem.dao;

import net.proselyte.crmsystem.model.Tag;
import java.util.UUID;

/**
 * Extension of {@link GenericDAO} interface for class {@link Tag}.
 *
 * @author Leonid Dubravsky
 */
public interface TagDAO extends GenericDAO<Tag, UUID>{
    Tag getByName(String name);
}
