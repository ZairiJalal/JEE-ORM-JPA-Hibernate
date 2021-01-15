package com.dao;

import java.util.List;


public interface ILivreDao {
	
	public void addLivre(Livre l);
	public List<Livre> chercherLivresParMC(String mc);
	public Livre getLivre(Long id);
	public void updateLivre(Livre l);
	public void deleteLivre(Long id);

}
