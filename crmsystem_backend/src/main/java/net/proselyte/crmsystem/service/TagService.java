package net.proselyte.crmsystem.service;

import net.proselyte.crmsystem.model.Tag;

import java.util.Collection;
import java.util.UUID;

/**
 * Service interface for class {@link Tag}.
 *
 * @author Leonid Dubravsky
 */
public interface TagService {
    Tag getById(UUID id);

    Tag getByName(String name);

    Collection<Tag> getAll();

    void save(Tag tag);

    void remove(Tag tag);
}
