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
public class SceneDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int idplateau;
    private int filmidfilm;
    private String nompersonnage;
    private String text;
    private String humeur;
    private Time durree;
    private String nomplateau;
    private int idpersonnage;
    private int sceneidscene;
    private String nomscene;
    private String resume;
    private String photo;

    public SceneDetail() {
    }

    public String getNompersonnage() {
        return nompersonnage;
    }

    public void setNompersonnage(String nompersonnage) {
        this.nompersonnage = nompersonnage;
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

    public Time getDurree() {
        return durree;
    }

    public void setDurree(Time durree) {
        this.durree = durree;
    }

    public String getNomplateau() {
        return nomplateau;
    }

    public void setNomplateau(String nomplateau) {
        this.nomplateau = nomplateau;
    }

    public int getIdpersonnage() {
        return idpersonnage;
    }

    public void setIdpersonnage(int idpersonnage) {
        this.idpersonnage = idpersonnage;
    }

    public int getIdplateau() {
        return idplateau;
    }

    public void setIdplateau(int idplateau) {
        this.idplateau = idplateau;
    }

    public int getSceneidscene() {
        return sceneidscene;
    }

    public void setSceneidscene(int sceneidscene) {
        this.sceneidscene = sceneidscene;
    }

    public String getNomscene() {
        return nomscene;
    }

    public void setNomscene(String nomscene) {
        this.nomscene = nomscene;
    }

    public int getFilmidfilm() {
        return filmidfilm;
    }

    public void setFilmidfilm(int filmidfilm) {
        this.filmidfilm = filmidfilm;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

}
