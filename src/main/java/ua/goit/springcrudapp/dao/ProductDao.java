package ua.goit.springcrudapp.dao;

import ua.goit.springcrudapp.model.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tramon on 27.01.2017.
 *
 */
@Repository
public interface ProductDao {

    public void addProduct(Product product);

    public void updateProduct(Product product);

    public void removeProduct(Integer id);

    public Product getProductById(Integer id);

    public List<Product> listProducts();

}
