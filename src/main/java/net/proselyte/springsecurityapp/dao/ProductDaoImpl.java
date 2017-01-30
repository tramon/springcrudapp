package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by tramon on 30.01.2017.
 */
public class ProductDaoImpl implements ProductDao {

    private static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void addProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(product);
        logger.info("Product successfully saved. Product details: " + product);
    }

    @Override
    public void updateProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(product);
        logger.info("Product successfully update. Product details: " + product);
    }

    @Override
    public void removeProduct(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, id);
        if(product!=null){
            session.delete(product);
        }
        logger.info("Product successfully removed. Product details: " + product);
    }

    @Override
    public Product getProductById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, id);
        logger.info("Product successfully loaded. Book Product: " + product);

        return product;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> listProducts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Product> productList = session.createQuery("from Product").list();

        for(Product product: productList){
            logger.info("Product list: " + product);
        }

        return productList;
    }
}
