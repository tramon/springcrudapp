package ua.goit.springcrudapp.validator;

import ua.goit.springcrudapp.model.Product;
import ua.goit.springcrudapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class ProductValidator implements Validator {

    private final ProductService productService;

    @Autowired
    public ProductValidator(ProductService productService) {
        this.productService = productService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Product product = (Product) o;

        //// TODO: 16.02.2017  finish implementation of product Validator
/*        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productname", "Required");
        if(product.getModel().length() < 2 || product.getModel().length() > 50) {
            errors.rejectValue("productname", "Size.productForm.productname");
        }

        if (productService.getProductById(product.getId()) != null) {
            errors.rejectValue("productname", "Duplicate.productForm.productname");
        }*/

    }
}
