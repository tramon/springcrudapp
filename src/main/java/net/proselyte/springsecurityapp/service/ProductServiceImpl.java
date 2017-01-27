package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.ProductDao;
import net.proselyte.springsecurityapp.dao.RoleDao;
import net.proselyte.springsecurityapp.model.Product;
import net.proselyte.springsecurityapp.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by tramo_000 on 27.01.2017.
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder; //TODO

    //add new product
    @Override
    public void save(Product product) {
        //TODO
/*        product.setPassword(bCryptPasswordEncoder.encode(product.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.getOne(1L));
        product.setRoles(roles);
        userDao.save(product);*/
    }


    @Override
    public Product findByProductName(String productName) {
        return productDao.findByProductName(productName);
    }



}
