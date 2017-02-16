package ua.goit.springcrudapp.service;

import ua.goit.springcrudapp.model.Product;

import java.util.List;

/**
 * Created by tramon on 27.01.2017.
 *
 */
public interface ProductService {

    public void addProduct(Product product);

    public void updateProduct(Product product);

    public void removeProduct(int id);

    public Product getProductById(int id);

    public List<Product> listProducts();

}
