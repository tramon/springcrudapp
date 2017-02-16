package net.proselyte.springsecurityapp.validator;

import net.proselyte.springsecurityapp.model.Product;
import net.proselyte.springsecurityapp.model.User;
import net.proselyte.springsecurityapp.service.ProductService;
import net.proselyte.springsecurityapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by tramon on 27.01.2017.
 */
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

/*        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productname", "Required");
        if(product.getModel().length() < 2 || product.getModel().length() > 50) {
            errors.rejectValue("productname", "Size.productForm.productname");
        }

        if (productService.getProductById(product.getId()) != null) {
            errors.rejectValue("productname", "Duplicate.productForm.productname");
        }*/

    }
}
