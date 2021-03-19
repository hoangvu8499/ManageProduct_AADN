package dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transaction;

//import javax.persistence.TypedQuery;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Root;

import org.hibernate.jpa.HibernateEntityManager;

import model.Product;

public class ProductDao {
	protected String getPersistenceIdentifier() {
		return "PersistenceTest";
	}

	protected HibernateEntityManager getEM() {
		return IvyEntityManager.getInstance().getIvyEntityManager(getPersistenceIdentifier());
	}

	public List<Product> getAll() {
		List<Product> listProduct = new ArrayList<>();
		listProduct = getEM().createQuery("SELECT p FROM Product p WHERE p.active=true ", Product.class)
				.getResultList();
		return listProduct;
	}

	public void save(Product product) {
		getEM().getTransaction().begin();
		try{
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
