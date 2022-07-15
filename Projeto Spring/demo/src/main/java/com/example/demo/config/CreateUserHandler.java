package com.example.demo.config;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

public class CreateUserHandler extends JdbcUserDetailsManager {

	@Override
	public void createUser(final UserDetails user) {
		super.getJdbcTemplate().update("insert into users (username, password, role ,enabled) values (?,?,?,?)", (ps) -> {
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3,  user.getAuthorities().iterator().next().getAuthority());
			ps.setInt(4, user.isEnabled() == true ? 1 :0);

		});
	}
}

