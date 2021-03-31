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

import ch.ivyteam.ivy.environment.Ivy;
import model.CartEntity;
import model.Category;
import model.OrderCart;
import model.Product;
import util.ReadNumber;

public class CartDao extends BaseDao {

	public List<CartEntity> getAll() {
		List<CartEntity> listCart = new ArrayList<>();
		listCart = getEM().createQuery("SELECT p FROM CartEntity p ", CartEntity.class).getResultList();
		return listCart;
	}

	public void save(CartEntity cart) {
		getEM().getTransaction().begin();
		try {
			if (cart.getId() == null) {
				getEM().persist(cart);
				getEM().getTransaction().commit();
			} else {
				getEM().merge(cart);
				getEM().getTransaction().commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getEM().close();
		}
	}

	public CartEntity findById(Long id) {
		getEM().getTransaction().begin();
		CartEntity cart = getEM().find(CartEntity.class, id);
		getEM().getTransaction().commit();
		return cart;
	}

	public CartEntity getNewCart(Long userId) {
		/*
		 * List<CartEntity> cart = new ArrayList();
		 */ Query query = getEM().createQuery("SELECT p FROM CartEntity p WHERE p.user.id = :userId ORDER BY id ",
				CartEntity.class);
		query.setParameter("userId", userId);
		return (CartEntity) query.getSingleResult();
	}
	
	public void deleteDetail(Long idCart, OrderCart orderCart) {
		getEM().getTransaction().begin();
		CartEntity cart = getEM().find(CartEntity.class, idCart);	
		Boolean removeCartDetail = false;

		int index =0;
		int number=0;
		for(OrderCart element: cart.getOrderCartList()) {
			if(element.getId().toString().equals(orderCart.getId().toString())) {
				number = index;
				removeCartDetail = true;
			}
			index+=1;
		}
		cart.getOrderCartList().remove(number);
		if(removeCartDetail == true) {
			cart.setTotalMoney(cart.getTotalMoney()-orderCart.getTotal());
			Double totalMoeny = cart.getTotalMoney();
			cart.setStringTotalMoney(ReadNumber.numberToString(totalMoeny.toString()));
		}
		getEM().getTransaction().commit();
		getEM().close();
	}

}
