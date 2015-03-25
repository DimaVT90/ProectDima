package com.dima.products.services;

import java.util.List;









import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dima.products.dao.ProductsDao;
import com.dima.products.model.Product;


@Service
@Transactional
public class ProductsServiceImpl implements ProductsService {

	@Autowired
	ProductsDao productsDao;

	public List<Product> getProductsList() {
		return productsDao.listOfPproduct();
	}
	
	public void addPproduct(Product p) {
		this.productsDao.insertProduct(p);
	}
	public void editPproduct(Product p) {
		this.productsDao.updateProduct(p);
	}
	public void updatePproduct(Product p) {
		this.productsDao.updateProduct(p);
	}
	public Product getPproductById(int id) {
		return this.productsDao.getProductById(id);
	}
	public void removePproduct(int id) {
		this.productsDao.deleteProduct(id);
	}
}
