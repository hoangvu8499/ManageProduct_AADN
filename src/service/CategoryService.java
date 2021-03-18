package service;

import org.hibernate.jpa.HibernateEntityManager;

import dao.IvyEntityManager;
import model.Category;

public class CategoryService {
	
	protected String getPersistenceIdentifier() {
		return "PersistenceTest";
	}
	protected HibernateEntityManager getEM() {
		return IvyEntityManager.getInstance().getIvyEntityManager(getPersistenceIdentifier());
	}

	
	public void saveEntity (Category category) {
		getEM().getTransaction().begin();
	    if (category.getId() == null) {
	        getEM().persist(category);
	        getEM().getTransaction().commit();
	    } else {
	    	getEM().merge(category);
	        getEM().getTransaction().commit();
	    }
	}
	


}
