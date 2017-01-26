package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tramon on 26.01.2017.
 */
public interface UserDao extends JpaRepository<User,Long> {

    User findByUsername(String username);



}
