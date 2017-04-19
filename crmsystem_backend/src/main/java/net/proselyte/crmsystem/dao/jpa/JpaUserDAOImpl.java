package net.proselyte.crmsystem.dao.jpa;

import net.proselyte.crmsystem.dao.UserDAO;
import net.proselyte.crmsystem.model.User;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.*;


/**
 * JPA implmentation of {@link UserDAO} interface.
 *
 * @author Eugene Suleimanov,
 * @author Vladimir Vitlitskiy
 *
 */

@Repository
public class JpaUserDAOImpl implements UserDAO {

    @PersistenceContext
    private EntityManager entityManager;

    private final static Logger logger = Logger.getLogger(JpaUserDAOImpl.class);

    @Override
    public User getById(UUID id) {
        Query query = this.entityManager.createQuery(
                "SELECT user FROM User user WHERE user.id =:id", User.class);
        query.setParameter("id", id);
        User user = (User) query.getSingleResult();

        logger.info("User successfully loaded. User details: " + user);
        return user;
    }

    @Override
    public User getByEmail(String email) {
        Query query = this.entityManager.createQuery(
                "SELECT user FROM User user WHERE user.email =:email", User.class);
            query.setParameter("email", email);
            User user;
               try {
                   user = (User) query.getSingleResult();
               } catch (NoResultException e){
                   logger.info("User not found. User details(email): " + email);
                   user =null;
               }

            logger.info("User successfully loaded. User details: " + user);
            return user;
    }

        @Override
    public Collection<User> getAll() {
        Collection<User> result;

        Query query = this.entityManager.createQuery("SELECT user FROM User user", User.class);
            result = query.getResultList();

        for (User user : result) {
            logger.info("User list: " + user);
        }
        return result;
    }

    @Override
    public void save(User user) {
        if (user.getId() == null) {
            this.entityManager.persist(user);
            logger.info("User successfully saved. User details: " + user);
        } else {
            this.entityManager.merge(user);
            logger.info("User successfully updated. User details: " + user);
        }
    }

    @Override
    public void remove(User user) {
        this.entityManager.remove(this.entityManager.getReference(User.class, user.getId()));
        logger.info("User successfully removed. User details: " + user);
    }

    @Override
    public User findByUserName(String username) {

        try {
            Query query = this.entityManager.createQuery("SELECT user FROM User user WHERE user.username=:name", User.class);
            query.setParameter("name", username);
            User user = (User) query.getSingleResult();
            return user;
        } catch (NoResultException e) {
            System.out.println("No result exception inside JpaUserDAOimpl(method findByUserName)");
            return null;
        }
    }

    @Override
    public User edit(User user) {
        Query query = this.entityManager.createQuery(
                "SELECT user FROM User as user WHERE user.id=:id", User.class);
        query.setParameter("id", user.getId());
        User existingUser = (User) query.getSingleResult();

        existingUser.setUsername(user.getUsername());
        existingUser.setEmail(user.getEmail());
        existingUser.setFirstName(user.getFirstName());
        existingUser.setLastName(user.getLastName());
        existingUser.setCompanies(user.getCompanies());
        existingUser.setTasks(user.getTasks());
        existingUser.setRoles(user.getRoles());
/**
 * entityManager.merge() -- вернет Task !!!
 */
        return this.entityManager.merge(existingUser);
    }


    @Override
    public Collection<User> getSortedUsers(String searchLine) {
        List<User> resultSearch;
        Query query = entityManager.createQuery(
                "SELECT DISTINCT user FROM User user LEFT JOIN FETCH user.roles WHERE user.username LIKE ? " +
                        "OR user.email LIKE ? OR user.firstName LIKE ? OR user.lastName LIKE ?");
        query.setParameter(0, "%"+searchLine+"%");
        query.setParameter(1, "%"+searchLine+"%");
        query.setParameter(2, "%"+searchLine+"%");
        query.setParameter(3, "%"+searchLine+"%");

        resultSearch=query.getResultList();
        for (User user : resultSearch) {
            logger.info("Search users list: " + user);
        }
        return resultSearch;
    }

    @Override
    public User getPrincipalUser(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        authentication.setAuthenticated(false);
            Object principal = authentication.getPrincipal();
            String username;
            if (principal instanceof UserDetails) {
                username = ((UserDetails) principal).getUsername();
            } else {
                username = principal.toString();
            }
            user = findByUserName(username);
        return user;
    }
}