package model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "product")
public class Product extends BaseEntity {

//	@NotNull(message = "Name is Not Null")
	private String name;

//	@NotNull(message = "Cost is Not Null")
	private Float cost;

	private Date deleted;

	@ManyToOne
	@JoinColumn(name = "id_category", nullable = false)
	private Category category;

	@OneToOne(mappedBy = "product")
	private OrderCart orderCart;
	
	@OneToMany(mappedBy = "product")
	private List<ImageProduct> imageList;

	public String getName() {
		return name;
	}
	
	public Date getDeleted() {
		return deleted;
	}

	public void setDeleted(Date deleted) {
		this.deleted = deleted;
	}


	public void setName(String name) {
		this.name = name;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public OrderCart getOrderCart() {
		return orderCart;
	}

	public void setOrderCart(OrderCart orderCart) {
		this.orderCart = orderCart;
	}

	public List<ImageProduct> getImageList() {
		return imageList;
	}

	public void setImageList(List<ImageProduct> imageList) {
		this.imageList = imageList;
	}

	public Product() {
		super();
	}
	
	
	
}
