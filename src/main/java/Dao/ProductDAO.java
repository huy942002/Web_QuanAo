package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Utils.JpaUtils;
import entities.Category;
import entities.Product;

public class ProductDAO {
	private EntityManager em;
	public ProductDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	public Product create(Product entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public Product findById(int id) {
		return this.em.find(Product.class, id);
	}
	public List<Product> all(){
		String jpql ="SELECT obj FROM Product obj";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		List<Product> result = query.getResultList();
		return result;
	}
	public Product Update(Product entity) throws Exception {
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
	public Product Delete(Product entity) throws Exception {
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
	
}
