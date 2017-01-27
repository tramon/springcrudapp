package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Product;
import net.proselyte.springsecurityapp.model.Role;
import net.proselyte.springsecurityapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tramon on 27.01.2017.
 */
public interface ProductDao extends JpaRepository<Product, Long> {

    Product findByProductName(String productName);
}
