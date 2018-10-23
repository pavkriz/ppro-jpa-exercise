package cz.uhk.ppro.jpa.exercise;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class App {

	public static void main(String[] args) {
		// Create the EntityManagerFactory & EntityManager
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-cviceni");
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();

		// TODO

		em.getTransaction().commit();
		em.close();
		emf.close();

	}

}
