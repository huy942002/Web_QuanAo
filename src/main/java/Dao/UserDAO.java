package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Utils.JpaUtils;
import entities.User;

public class UserDAO {
	private EntityManager em;
	public  UserDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	public User create(User entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			// Todo...
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public List<User> all() {		String jpql = "SELECT obj FROM User obj";
		TypedQuery<User> query= this.em.createQuery(jpql, User.class);
		List<User> result = query.getResultList();
		return result;
	}
	public User findById(int id) {
		return this.em.find(User.class, id);
	}
	public User Delete(User entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			// Todo...
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public User Update(User entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			// Todo...
			this.em.merge(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public User findByEmail(String email) {
		String jpql = "SELECT obj FROM User obj "
				+ "WHERE obj.email = :email";
		TypedQuery<User> query = this.em
			.createQuery(jpql, User.class);
		query.setParameter("email", email);
		
		return query.getSingleResult();
	}
}
