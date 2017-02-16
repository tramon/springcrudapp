package ua.goit.springcrudapp.dao;

import ua.goit.springcrudapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by tramon on 26.01.2017.
 *
 */
@Repository
public interface UserDao extends JpaRepository<User, Integer> {

    User findByUsername(String username);


}
