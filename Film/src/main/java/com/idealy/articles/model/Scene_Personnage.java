/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import java.sql.Time;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author 26132
 */
@Entity
public class Scene_Personnage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idScene_Personnage;
    private int Sceneidscene;
    private int PersonnageidPersonnage;
    private String text;
    private String humeur;
    private Time durree;
    private int idPlateau;
    private int status;

    public int getIdScene_Personnage() {
        return idScene_Personnage;
    }

    public void setIdScene_Personnage(int idScene_Personnage) {
        this.idScene_Personnage = idScene_Personnage;
    }

    public int getSceneidscene() {
        return Sceneidscene;
    }

    public void setSceneidscene(int Sceneidscene) {
        this.Sceneidscene = Sceneidscene;
    }

    public int getPersonnageidPersonnage() {
        return PersonnageidPersonnage;
    }

    public void setPersonnageidPersonnage(int PersonnageidPersonnage) {
        this.PersonnageidPersonnage = PersonnageidPersonnage;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getHumeur() {
        return humeur;
    }

    public void setHumeur(String humeur) {
        this.humeur = humeur;
    }

    public int getIdPlateau() {
        return idPlateau;
    }

    public void setIdPlateau(int idPlateau) {
        this.idPlateau = idPlateau;
    }

    public Time getDurree() {
        return durree;
    }

    public void setDurree(Time durree) {
        this.durree = durree;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
