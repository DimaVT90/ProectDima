package com.dima.products.dao;

import java.util.List;







import com.dima.products.model.Product;

public interface ProductsDao {

	public List<Product> listOfPproduct();

	public void insertProduct(Product p);

	public void updateProduct(Product p);

	public Product getProductById(int id);

	public void deleteProduct(int id);
}
