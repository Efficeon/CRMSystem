package net.proselyte.crmsystem.service;

/**
 * Service for security
 *
 * @author Eugene Suleimanov
 */

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);

    String generatePassword();
}
