package com.dima.products.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dima.products.model.Product;

@Repository
public class ProductsDaoImpl implements ProductsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Product> listOfPproduct() {

		return this.sessionFactory.getCurrentSession()
				.createQuery("from Product").list();

	}

	public void insertProduct(Product p) {

		this.sessionFactory.getCurrentSession().persist(p);

	}

	public void updateProduct(Product p) {

		this.sessionFactory.getCurrentSession().update(p);

	}

	public Product getProductById(int id) {

		Session session = this.sessionFactory.getCurrentSession();
		Product p = (Product) session.get(Product.class, id);

		return p;
	}

	public void deleteProduct(int id) {

		Session session = this.sessionFactory.getCurrentSession();
		Product p = (Product) session.load(Product.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}

	}

}
