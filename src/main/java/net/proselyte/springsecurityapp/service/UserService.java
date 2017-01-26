package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.User;

/**
 * Created by tramon on 26.01.2017.
 */


public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
