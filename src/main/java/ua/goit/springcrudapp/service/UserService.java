package ua.goit.springcrudapp.service;

import ua.goit.springcrudapp.model.User;

/**
 * Created by tramon on 26.01.2017.
 *
 */


public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
