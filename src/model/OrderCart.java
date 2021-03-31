package model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity; 
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "order_cart")
public class OrderCart extends BaseEntity {

	@OneToOne
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToOne()
	@JoinColumn(name = "cart_id", nullable = false)
	private CartEntity cart;

	private int amount;
	
	private Date deleted;
	

	private Double total;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public CartEntity getCart() {
		return cart;
	}

	public void setCart(CartEntity cart) {
		this.cart = cart;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getDeleted() {
		return deleted;
	}

	public void setDeleted(Date deleted) {
		this.deleted = deleted;
	}

	public OrderCart(Product product) {
		this.product = product;
	}

	public OrderCart(Product product, CartEntity cart) {
		this.product = product;
		this.cart = cart;
	}

	public OrderCart() {}

}
