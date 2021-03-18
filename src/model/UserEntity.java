package model;

import javax.persistence.Table;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@Table(name = "user_infor")
public class UserEntity extends BaseEntity {

	private String email;

	private String password;

	@OneToOne(mappedBy = "user")
	private CartEntity cart;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public CartEntity getCart() {
		return cart;
	}

	public void setCart(CartEntity cart) {
		this.cart = cart;
	}

}
