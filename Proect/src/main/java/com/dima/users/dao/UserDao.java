package com.dima.users.dao;

import com.dima.users.model.User;

public interface UserDao {

	User findByUserName(String username);

}