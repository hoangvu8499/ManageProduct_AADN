package dao;

import java.util.ArrayList;
import java.util.List;

import model.Category;

public class CategoryDao extends BaseDao {

	public void saveEntity(Category category) {
		getEM().getTransaction().begin();
		if (category.getId() == null) {
			getEM().persist(category);
			getEM().getTransaction().commit();
		} else {
			getEM().merge(category);
			getEM().getTransaction().commit();
		}
	}

	public List<Category> getAll() {
		List<Category> listCategory = new ArrayList<>();
		listCategory = getEM().createQuery("SELECT p FROM Category p ", Category.class).getResultList();
		return listCategory;
	}

}
