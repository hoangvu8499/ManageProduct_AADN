package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import ch.ivyteam.ivy.environment.Ivy;
import model.OrderCart;

public class OrderCartDao extends BaseDao {

	public List<OrderCart> getByIdCart(Long idCard) {
		List<OrderCart> listOrderCart = new ArrayList<>();
		listOrderCart = getEM().createQuery("SELECT p FROM OrderCart p WHERE p.cart.id = idCard ", OrderCart.class)
				.setParameter("idCard", idCard).getResultList();
		return listOrderCart;
	}

	public void save(OrderCart cart) {
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

	public OrderCart findById(Long id) {
		getEM().getTransaction().begin();
		OrderCart orderCart = getEM().find(OrderCart.class, id);
		getEM().getTransaction().commit();
		getEM().close();
		return orderCart;
	}

	public OrderCart findByIdProductAndIdCart(Long idProduct, Long idCart) {
		Query query = getEM().createQuery(
				"SELECT p FROM OrderCart p WHERE p.product.id = :idProduct AND p.cart.id = :idCart ", OrderCart.class);
		query.setParameter("idProduct", idProduct);
		query.setParameter("idCart", idCart);
		if (query.getResultList() == null || query.getResultList().isEmpty()) {
			return null;
		}
		return (OrderCart) query.getResultList().get(0);
	}

	public void deleteOrderCart(Long id) throws Exception {
		try {
			OrderCart orderCart = findById(id);
			getEM().getTransaction().begin();
			getEM().remove(orderCart);
			getEM().flush();
			getEM().getTransaction().commit();
		} catch (Exception e) {
			throw new Exception("Cannot Delete Cart Detail");
		} finally {
			getEM().close();
		}
	}

}
