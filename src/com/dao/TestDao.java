package com.dao;

import java.util.List;

public class TestDao {

	public static void main(String[] args) {
		ILivreDao metier = new LivreDaoImp() ;
		metier.addLivre(new Livre("xxxx","yyyy", 300.0, 4));
		
		List<Livre> livres = metier.chercherLivresParMC("");
		for (Livre l:livres) {	
			System.out.println(l.toString());
		}


	}

}
