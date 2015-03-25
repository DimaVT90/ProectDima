package com.dima.products.services;

import java.util.List;

import com.dima.products.model.Product;

public interface ProductsService {

	public List<Product> getProductsList();

	public void addPproduct(Product p);

	public void editPproduct(Product p);

	public Product getPproductById(int id);

	public void updatePproduct(Product p);

	public void removePproduct(int id);
}
