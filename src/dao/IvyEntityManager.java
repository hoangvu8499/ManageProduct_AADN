package dao;

import java.lang.Thread.State;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.PersistenceException;

import org.hibernate.jpa.HibernateEntityManager;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.process.data.persistence.IPersistenceContext;


/**
 * Singleton class to hold IvyEntityManager.
 * 
 * @author jpl
 */
public class IvyEntityManager {

	private static IvyEntityManager singleton = new IvyEntityManager();
	//	private final HashMap<Integer,HashMap<Long,HibernateEntityManager>> registry;
	//	private final HashMap<Long, Integer> sessions = new HashMap<>();
	private final ThreadLocal<Integer> sessions = new ThreadLocal<Integer>();
	private final ThreadLocal<HibernateEntityManager> threadLocalEntityManager =  new ThreadLocal<HibernateEntityManager>();
	//	private final ThreadLocal<Boolean> useDefaultContext = new ThreadLocal<Boolean>();
	// just for logging purposes
	private static final Map<Thread, HibernateEntityManager> currentEntityManagers = Collections.synchronizedMap(new HashMap<Thread, HibernateEntityManager>());
	// astecs db query in IvyAddOns context
	private static final IPersistenceContext defaultContext = Ivy.persistence();


	/**
	 * @return the single instance of {@link IvyEntityManager}
	 */
	public static IvyEntityManager getInstance() {
		if(singleton == null){
			singleton = new IvyEntityManager();
		}
		return singleton;
	}

	/**
	 * destroy the current singleton of {@link IvyEntityManager}
	 */
	public void destroy() {
		//		for(Long sessionKey : sessions.keySet()) {
		//			destroySession(sessionKey.intValue());
		//		}
		singleton = null;
	}

	/**
	 * locked constructor
	 */
	private IvyEntityManager() {
	}

	/**
	 * Get the {@link HibernateEntityManager} for a specific persistence identifier.
	 * For creating a new {@link HibernateEntityManager} the current context will be used. If used persistenceIdentifier
	 * is not known by the current context, the default context (context of the holding project of this class) will be used.
	 * 
	 * @param persistenceIdentifier
	 * @return the registered entity manager
	 */
	public HibernateEntityManager getIvyEntityManager(String persistenceIdentifier) {
		HibernateEntityManager em = threadLocalEntityManager.get();
		if(em == null || !em.isOpen()) {
			IPersistenceContext ipc = Ivy.persistence();

			try {
				em = (HibernateEntityManager) ipc.get(persistenceIdentifier).createEntityManager();
			} catch(Exception e) {
				if(PersistenceException.class.isAssignableFrom(e.getClass()) && e.toString().contains("Could not create EntityManager for persistence unit")) {
					em = (HibernateEntityManager) defaultContext.get(persistenceIdentifier).createEntityManager();
				} else {
					throw e;
				}
			};

			threadLocalEntityManager.set(em);
			currentEntityManagers.put(Thread.currentThread(), em);
		}
		return em;
	}

	/**
	 * Cleanup the map of entity managers.
	 * 
	 * Looks through the map of entity managers and removed entity managers
	 * associated with terminated thread.
	 */
	public static void cleanupEntityManagers() {
		Set<Entry<Thread, HibernateEntityManager>> entrySet = currentEntityManagers.entrySet();

		for (Entry<Thread, HibernateEntityManager> entry : entrySet) {
			Thread thread = entry.getKey();

			if (State.TERMINATED.equals(thread.getState())) {
				HibernateEntityManager entityManager = entry.getValue();
				if (entityManager.isOpen()) {
					entityManager.clear();
					entityManager.close();
				}

				currentEntityManagers.remove(thread);
			}
		}
	}

	/**
	 * Tags the beginning of a new session. This is used to keep track of open sessions for correct closing of session.
	 */
	public void beginSession() {
		Integer count = sessions.get();
		if(count == null) {
			count = 0;
		}
		sessions.set(++count);
	}

	/**
	 * Removes the last tag of a started session (with beginSession()). If the last tag is removed, the session and entityManager 
	 * will be cleared, closed and removed from known EntityManagers.
	 */
	public void closeSession() {

		Integer count = sessions.get();
		if(count == null) {
			count = 1;
		}
		count --;

		if(count <= 0) {
			
			HibernateEntityManager em = threadLocalEntityManager.get();
			if(em != null) {
				threadLocalEntityManager.remove();
				currentEntityManagers.remove(Thread.currentThread());
				em.clear();
				em.close();
			}
			sessions.remove();
		} else {
			sessions.set(count);
		}

		
	}

	/**
	 * Gets the current known EntityManagers.
	 * @return
	 */
	public static Map<Thread, HibernateEntityManager> getCurrentEntityManagers() {
		return currentEntityManagers;
	}
}
