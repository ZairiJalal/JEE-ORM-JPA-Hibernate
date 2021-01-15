package com.dao;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Livre implements Serializable {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nom;
	private String auteur;
	private Double prix;
	private int quantite;
	
	public Livre() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Livre(String nom, String auteur, Double prix, int quantite) {
		super();
		this.nom = nom;
		this.auteur = auteur;
		this.prix = prix;
		this.quantite = quantite;
	}
	public Livre(Long id, String nom, String auteur, Double prix, int quantite) {
		super();
		this.id=id;
		this.nom = nom;
		this.auteur = auteur;
		this.prix = prix;
		this.quantite = quantite;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	public Double getPrix() {
		return prix;
	}
	public void setPrix(Double prix) {
		this.prix = prix;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	@Override
	public String toString() {
		return "Livre [id=" + id + ", nom=" + nom + ", auteur=" + auteur + ", prix=" + prix + ", quantite=" + quantite
				+ "]";
	}
}
