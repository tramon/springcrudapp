package ua.goit.springcrudapp.service;


public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
