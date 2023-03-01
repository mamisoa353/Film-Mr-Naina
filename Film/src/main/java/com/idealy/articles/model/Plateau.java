/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author 26132
 */
@Entity
public class Plateau {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPlateau;
    private String nomPlateau;

    public int getIdPlateau() {
        return idPlateau;
    }

    public void setIdPlateau(int idPlateau) {
        this.idPlateau = idPlateau;
    }

    public String getNomPlateau() {
        return nomPlateau;
    }

    public void setNomPlateau(String nomPlateau) {
        this.nomPlateau = nomPlateau;
    }
    

}
