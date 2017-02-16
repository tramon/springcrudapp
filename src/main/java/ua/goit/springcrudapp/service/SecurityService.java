package ua.goit.springcrudapp.service;

/**
 * Created by tramon 26.01.2017.
 */
public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
