package model;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product extends BaseEntity {

	private String image;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	private String name;

	private Float cost;

	private Date deleted;

	@ManyToOne
	@JoinColumn(name = "id_category", nullable = false)
	private Category category;

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
