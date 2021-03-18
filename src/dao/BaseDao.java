package dao;

import org.hibernate.jpa.HibernateEntityManager;

public class BaseDao  {
	
	protected String getPersistenceIdentifier() {
		return "PersistenceTest";
	}
	protected HibernateEntityManager getEM() {
		return IvyEntityManager.getInstance().getIvyEntityManager(getPersistenceIdentifier());
	}

	

}
