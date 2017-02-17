package ua.goit.springcrudapp.service;

import ua.goit.springcrudapp.model.User;


public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
