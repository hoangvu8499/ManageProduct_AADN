package model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class CartEntity extends BaseEntity {

	@OneToOne
	@JoinColumn(name = "user_id")
	private UserEntity user;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cart", cascade = CascadeType.ALL)
	private List<OrderCart> orderCartList;

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public List<OrderCart> getOrderCartList() {
		return orderCartList;
	}

	public void setOrderCartList(List<OrderCart> orderCartList) {
		this.orderCartList = orderCartList;
	}

	public CartEntity(UserEntity user) {
		super();
		this.user = user;
	}

	public CartEntity() {
		super();
	}

}
