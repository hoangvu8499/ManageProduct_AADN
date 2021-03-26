package dao;

import java.util.ArrayList;
import java.util.List;

import model.UserEntity;

public class UserDao extends BaseDao {

	public List<UserEntity> getAll() {
		List<UserEntity> listUser = new ArrayList<>();
		listUser = getEM().createQuery("SELECT p FROM UserEntity p ", UserEntity.class)
				.getResultList();
		return listUser;
	}

	public void save(UserEntity user) {
		getEM().getTransaction().begin();
		try {
			if (user.getId() == null) {
				getEM().persist(user);
				getEM().getTransaction().commit();
			} else {
				getEM().merge(user);
				getEM().getTransaction().commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getEM().close();
		}
	}

	public UserEntity findById(Long id) {
		getEM().getTransaction().begin();
		UserEntity user = getEM().find(UserEntity.class, id);
		getEM().getTransaction().commit();
		return user;
	}

}
