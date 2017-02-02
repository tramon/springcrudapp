package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Product;
import net.proselyte.springsecurityapp.model.Role;
import net.proselyte.springsecurityapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by tramon on 27.01.2017.
 */
public interface ProductDao {

    public void addProduct(Product product);

    public void updateProduct(Product product);

    public void removeProduct(Integer id);

    public Product getProductById(Integer id);

    public List<Product> listProducts();

}
