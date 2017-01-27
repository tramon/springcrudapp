package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.service.ProductService;
import net.proselyte.springsecurityapp.service.SecurityService;
import net.proselyte.springsecurityapp.service.UserService;
import net.proselyte.springsecurityapp.validator.ProductValidator;
import net.proselyte.springsecurityapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tramo_000 on 27.01.2017.
 */
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private ProductValidator productValidator;


    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String products(Model model) {
        return "products";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model) {
        return "edit";
    }

}
