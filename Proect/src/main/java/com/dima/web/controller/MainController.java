package com.dima.web.controller;

import javax.servlet.http.HttpServletRequest;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dima.products.model.Product;
import com.dima.products.services.ProductsService;

@Controller
public class MainController {

	@Autowired
	ProductsService productsService;

	@RequestMapping(value = { "/", "/listProductUser" }, method = RequestMethod.GET)
	public ModelAndView getUsersListProduct() {
		ModelAndView model = new ModelAndView();
		model.addObject("productsList", this.productsService.getProductsList());
		model.setViewName("usersPage");
		return model;

	}

	@RequestMapping(value = "/listAdmin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("productsList", this.productsService.getProductsList());
		model.setViewName("adminPage");

		return model;

	}

	@RequestMapping("/formProduct")
	public ModelAndView getFormProduct() {

		return new ModelAndView("ProductForm", "product", new Product());

	}

	@RequestMapping(value = "/registerProduct", method = RequestMethod.GET)
	public String registerProduct(@Valid Product product,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "ProductForm";
		}
		if (product.getId() == 0)
			productsService.addPproduct(product);
		else
			productsService.updatePproduct(product);

		return "redirect:listAdmin";
	}

	@RequestMapping("/editProduct")
	public ModelAndView editProduct(@RequestParam int id) {

		return new ModelAndView("ProductForm", "product",
				this.productsService.getPproductById(id));

	}

	@RequestMapping("/removeProduct")
	public String removeProduct(@RequestParam int id) {

		this.productsService.removePproduct(id);
		return "redirect:listAdmin";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error",
					getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession()
				.getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

}