package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

//import javax.persistence.TypedQuery;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Root;

import org.hibernate.jpa.HibernateEntityManager;

import model.Category;
import model.Product;

public class ProductDao extends BaseDao {

	public List<Product> getAll() {
		List<Product> listProduct = new ArrayList<>();
		listProduct = getEM().createQuery("SELECT p FROM Product p WHERE p.deleted=null ", Product.class)
				.getResultList();
		return listProduct;
	}

	public void save(Product product) {
		getEM().getTransaction().begin();
		try {
			if (product.getId() == null) {
				getEM().persist(product);
				getEM().getTransaction().commit();
			} else {
				getEM().merge(product);
				getEM().getTransaction().commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getEM().close();
		}
	}

	public Product findById(Integer id) {
		getEM().getTransaction().begin();
		Product product = getEM().find(Product.class, id);
		getEM().getTransaction().commit();
		return product;
	}

	public Boolean checkExist(Product product) {
		List<Product> listProduct = new ArrayList<>();
		Query query = getEM().createQuery(
				"SELECT p FROM Product p WHERE p.name = :name AND p.category.id = :idCategory AND p.deleted=null ",
				Product.class);
		query.setParameter("name", product.getName());
		query.setParameter("idCategory", product.getCategory().getId());
		listProduct = query.getResultList();
		if (listProduct.size() > 0) {
			return false;
		}
		return true;
	}

	public List<Product> getProductDeleted() {
		List<Product> listProduct = new ArrayList<>();
		listProduct = getEM().createQuery("SELECT p FROM Product p WHERE p.deleted!=null ", Product.class)
				.getResultList();
		return listProduct;
	}

	public List<Product> getNewProduct() {
		List<Product> listProduct = new ArrayList<>();
		listProduct = getEM()
				.createQuery("SELECT p FROM Product p WHERE p.deleted=null ORDER BY id DESC ", Product.class)
				.setMaxResults(5).getResultList();
		return listProduct;
	}

	public List<Product> getByCategory(Long id) {
		List<Product> listProduct = new ArrayList<>();
		listProduct = getEM()
				.createQuery("SELECT p FROM Product p WHERE p.deleted=null and p.category.id = :id ", Product.class)
				.setParameter("id", id).getResultList();
		return listProduct;
	}

//	public List<Product> getAllPart2() {
//		CriteriaBuilder cb = getEM().getCriteriaBuilder();
//		CriteriaQuery<Product> cq = cb.createQuery(Product.class);
//		Root<Product> rootEntry = cq.from(Product.class);
//		CriteriaQuery<Product> all = cq.select(rootEntry);
//		
//		TypedQuery<Product> allQuery = getEM().createQuery(all);
//		
//		return allQuery.getResultList();
//	}
}
