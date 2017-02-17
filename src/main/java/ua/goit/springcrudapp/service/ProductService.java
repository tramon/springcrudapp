package ua.goit.springcrudapp.service;

import ua.goit.springcrudapp.model.Product;

import java.util.List;


public interface ProductService {

    public void addProduct(Product product);

    public void updateProduct(Product product);

    public void removeProduct(int id);

    public Product getProductById(int id);

    public List<Product> listProducts();

}
