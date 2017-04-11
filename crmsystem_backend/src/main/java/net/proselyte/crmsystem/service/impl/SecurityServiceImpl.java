package net.proselyte.crmsystem.service.impl;

import net.proselyte.crmsystem.service.SecurityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.Random;


/**
 * Implementation of {@link SecurityService} interface
 *
 * @author Eugene Suleimanov
 * @version 1.0
 */

@Service
public class SecurityServiceImpl implements SecurityService {

    private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    public String findLoggedInUsername() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails) userDetails).getUsername();
        }
        return null;
    }

    @Override
    public void autoLogin(String username, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
        authenticationManager.authenticate(authenticationToken);

        if (authenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            logger.debug(String.format("Successfully %s auto logged in", username));
        }
    }

    @Override
    public String generatePassword(){
        String charsCaps="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String Chars="abcdefghijklmnopqrstuvwxyz";
        String nums="0123456789";
        String symbols="!@#$%^&*()_+-=.,/';:?><~*/-+";
        String passSymbols=charsCaps + Chars + nums +symbols;
        Random rnd=new Random();
        char[] password=new char[8];
        int index=0;
        for(int i=0; i<8;i++){
            password[i]=passSymbols.charAt(rnd.nextInt(passSymbols.length()));
        }
        String pass = String.valueOf(password);
        return pass;
    }
}