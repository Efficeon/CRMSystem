package net.proselyte.crmsystem.validator;

import net.proselyte.crmsystem.model.User;
import net.proselyte.crmsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Validator for {@link User} class,
 * implements {@link Validator} interface.
 *
 * @author Eugene Artemenko
 * @version 1.0
 */

@Component
@Configuration
@PropertySource("classpath:validation/validationSettings.properties")
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;

    @Autowired
    private Environment env;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }


    @Override
    public void validate(Object ob, Errors errors) {

        User user = (User) ob;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "key.required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "key.required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "key.required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "key.required");

        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userType", "key.required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "key.required");

        if(!checkUserNameWithRegExp(user.getUsername(),
                Integer.parseInt(env.getProperty("key.min.count.characters.username")),
                Integer.parseInt(env.getProperty("key.max.count.characters.username")))){
            user.setUsername("");
            errors.rejectValue("username", "key.size.userForm.username",
                    new String[]{String.valueOf(env.getProperty("key.min.count.characters.username")),
                            String.valueOf(env.getProperty("key.max.count.characters.username"))}, null);
        }

        if (userService.findByUserName(user.getUsername()) != null) {
            errors.rejectValue("username", "key.duplicate.userForm.username");
        }

        if (!checkPasswordWithRegExp(user.getPassword(),
                Integer.parseInt(env.getProperty("key.min.count.characters.password")),
                Integer.parseInt(env.getProperty("key.max.count.characters.password")))) {
            user.setPassword("");
            errors.rejectValue
                    ("password", "key.size.userForm.password",
                            new String[]{String.valueOf(env.getProperty("key.min.count.characters.password")),
                                    String.valueOf(env.getProperty("key.max.count.characters.password"))}, null);
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            user.setConfirmPassword("");
            errors.rejectValue("confirmPassword", "key.different.userForm.password");
        }

        if ((!checkEmailWithRegExp(user.getEmail())) || (userService.getByEmail(user.getEmail())!=null)){
            user.setEmail("");
            errors.rejectValue
                    ("email", "key.not.correctly.email",null);
        }
    }

    private boolean checkUserNameWithRegExp(String str,int... key){
        Pattern p = Pattern.compile("^[a-zA-Z][a-zA-Z0-9-_.]{" + key[0] + "," + key[1] + "}$");
        Matcher m = p.matcher(str);
        return m.matches();
    }

    private boolean checkPasswordWithRegExp(String str,int... key){
        Pattern p = Pattern.compile(
                "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^\\w\\s]).{"
                        + key[0] + "," + key[1] + "}$");
        Matcher m = p.matcher(str);
        return m.matches();
    }

    private boolean checkEmailWithRegExp(String str){
        Pattern p = Pattern.compile("^[-\\w\\W.]+@[-\\w\\W][^@]+$");
        Matcher m = p.matcher(str);
        return m.matches();
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

}
