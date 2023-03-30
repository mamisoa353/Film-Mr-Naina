/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import java.sql.Date;
import java.util.ArrayList;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author 26132
 */
@Entity
public class indispoPlateau {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int idplateau;
    private Date date;

    public indispoPlateau(int idplateau, Date date) {
        this.idplateau = idplateau;
        this.date = date;
    }

    public indispoPlateau() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdplateau() {
        return idplateau;
    }

    public void setIdplateau(int idplateau) {
        this.idplateau = idplateau;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Boolean estIndisponible(ArrayList<indispoPlateau> liste) {
        for (int i = 0; i < liste.size(); i++) {
            if (comapare(liste.get(i).getDate(), this.getDate()) && liste.get(i).getIdplateau() == this.getIdplateau()) {
                return true;
            }
        }

        return false;
    }

    public boolean comapare(Date d1, Date d2) {
        if (d1.getYear() == d2.getYear() && d1.getMonth() == d2.getMonth() && d1.getDay() == d2.getDay()) {
            return true;
        }

        return false;
    }
}
