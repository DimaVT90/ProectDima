package com.dima.products.model;

import javax.persistence.Column;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "products", catalog = "proect")
public class Product {

	private int id;
	@Size(min=1, max=30, message="Name of product mast be between3 and 30 characters long.")
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="Name of product mast be alphanumeric with no spaces.")
	private String name;
	
	private double price;

	private double quantity;

	public Product() {
		super();
	}

	public Product(int id, String name, double price, double quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id_product", nullable = false, unique = true)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "name_product", nullable = false, length = 60)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "price_product", nullable = false)
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "quantity_product", nullable = false)
	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

}
