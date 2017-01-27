package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Product;
import net.proselyte.springsecurityapp.model.User;

/**
 * Created by tramon on 27.01.2017.
 */
public interface ProductService {

    void save(Product product);

    Product findByProductName(String productName);

}
