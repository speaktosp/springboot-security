package com.consumerreports.auth.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.consumerreports.auth.model.User;
import com.consumerreports.auth.service.UserService;

@Component
public class UserValidator implements Validator {
	@Autowired
	private UserService userService;

	private Pattern pattern;
	private Matcher matcher;

	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	@Override
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		User user = (User) o;

		String username = user.getUsername();

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
		// email validation 
		if (username.length() < 6 || username.length() > 32) {
			errors.rejectValue("username", "Size.userForm.username");
		}
		pattern = Pattern.compile(EMAIL_PATTERN);
		matcher = pattern.matcher(username);
		if (!matcher.matches()) {
			errors.rejectValue("username", "Email.userForm.username.EmailNotValid");
		} 

		if (userService.findByUsername(username) != null) {
			errors.rejectValue("username", "Duplicate.userForm.username");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
			errors.rejectValue("password", "Size.userForm.password");
		}

		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}
	}
}
