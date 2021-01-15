package com.dao;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class LivreDaoImp implements ILivreDao {
	
	SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	

	public void addLivre(Livre l) {
		
		Session session = sessionFactory.openSession();		
		session.beginTransaction();
		session.save(l);
		session.getTransaction().commit();
		session.close();
					
	}
	
	public List<Livre> chercherLivresParMC(String mc) {		
		List<Livre> livres = null; 		
		Session session = sessionFactory.openSession();		
		session.beginTransaction();
		Query query = session.createQuery("from Livre as l where l.nom like '%"+mc+"%' ");
		livres = query.list();
		session.getTransaction().commit();
		session.close();
		return livres;
		
	}

	public Livre getLivre(Long id) {
        Livre livre = null;
        Session session = sessionFactory.openSession();	
        session.beginTransaction();
        livre = (Livre) session.get(Livre.class, id);
        session.getTransaction().commit();
		session.close();
		return livre;
	}

	public void updateLivre(Livre l) {       
        Session session = sessionFactory.openSession();	
        session.beginTransaction();
        session.update(l);
        session.getTransaction().commit();
		session.close();		
	}

	public void deleteLivre(Long id) {		
            Session session = sessionFactory.openSession();	
            session.beginTransaction();
            Livre user = (Livre) session.get(Livre.class, id);
            session.delete(user);
            session.getTransaction().commit();
    		session.close();	
	}	
}
