package ua.goit.springcrudapp.dao;

import ua.goit.springcrudapp.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class ProductDaoImpl implements ProductDao {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void addProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(product);
        LOGGER.info("Product successfully saved. Product details: " + product);
    }

    @Override
    public void updateProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(product);
        LOGGER.info("Product successfully update. Product details: " + product);
    }

    @Override
    public void removeProduct(Integer id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, new Integer(id));
        if (product != null) {
            session.delete(product);
        }
        LOGGER.info("Product successfully removed. Product details: " + product);
    }

    @Override
    public Product getProductById(Integer id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, new Integer(id));
        LOGGER.info("Product successfully loaded. Book Product: " + product);

        return product;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> listProducts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Product> productList = session.createQuery("from Product").list();

        for (Product product : productList) {
            LOGGER.info("Product list: " + product);
        }

        return productList;
    }
}
