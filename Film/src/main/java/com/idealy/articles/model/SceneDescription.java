/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import java.sql.Time;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author 26132
 */
@Entity
public class SceneDescription {

    private Time Total;
    private String nomplateau;
    private int nbrScene;
    private int nbPerso;

    private int filmidfilm;
    @Id
    private int idplateau;

    public Time getTotal() {
        return Total;
    }

    public void setTotal(Time Total) {
        this.Total = Total;
    }

    public String getNomplateau() {
        return nomplateau;
    }

    public void setNomplateau(String nomplateau) {
        this.nomplateau = nomplateau;
    }

    public int getNbrScene() {
        return nbrScene;
    }

    public void setNbrScene(int nbrScene) {
        this.nbrScene = nbrScene;
    }

    public int getNbPerso() {
        return nbPerso;
    }

    public void setNbPerso(int nbPerso) {
        this.nbPerso = nbPerso;
    }

    public int getFilmidfilm() {
        return filmidfilm;
    }

    public void setFilmidfilm(int filmidfilm) {
        this.filmidfilm = filmidfilm;
    }

    public SceneDescription() {
    }

    public int getIdplateau() {
        return idplateau;
    }

    public void setIdplateau(int idplateau) {
        this.idplateau = idplateau;
    }


}
