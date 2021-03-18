package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category extends BaseEntity {

	@Column(name = "name")
	private String name;

	@OneToMany(mappedBy = "category")
	private List<Product> productList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public Category(String name) {
		super();
		this.name = name;
	}

	public Category() {
		super();
	}

}
