package net.proselyte.springsecurityapp.dao;


import net.proselyte.springsecurityapp.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tramon on 26.01.2017.
 */
public interface RoleDao extends JpaRepository<Role, Integer> {


}
