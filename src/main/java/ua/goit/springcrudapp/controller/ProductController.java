package ua.goit.springcrudapp.controller;

import ua.goit.springcrudapp.model.Product;
import ua.goit.springcrudapp.service.ProductService;
import ua.goit.springcrudapp.validator.ProductValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ProductController {

    private ProductService productService;

    private ProductValidator productValidator;

    @Autowired
    public ProductController(ProductValidator productValidator, ProductService productService) {
        this.productValidator = productValidator;
        this.productService = productService;
    }

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listProducts(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("listProducts", this.productService.listProducts());
        return "products";
    }

    @RequestMapping(value = "/products", method = RequestMethod.POST)
    public String products(@ModelAttribute("productForm") Product productForm, BindingResult bindingResult, Model model) {
        productValidator.validate(productForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        return "products";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("listProducts", this.productService.listProducts());
        return "admin";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product) {
        if (product.getId().equals(0)) {
            this.productService.addProduct(product);
        } else {
            this.productService.updateProduct(product);
        }
        return "redirect:/admin";
    }

    @RequestMapping("/remove/{id}")
    public String removeProduct(@PathVariable("id") int id) {
        this.productService.removeProduct(id);

        return "redirect:/admin";
    }

    @RequestMapping("edit/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        model.addAttribute("product", this.productService.getProductById(id));
        model.addAttribute("listProducts", this.productService.listProducts());

        return "admin";
    }

    @RequestMapping("productdata/{id}")
    public String productData(@PathVariable("id") int id, Model model) {
        model.addAttribute("product", this.productService.getProductById(id));

        return "productdata";
    }


}
