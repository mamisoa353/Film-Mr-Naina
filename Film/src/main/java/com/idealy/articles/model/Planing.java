/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import hibernate.dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author 26132
 */
@Entity
@Table(name = "v_plan")
public class Planing {

    private Time Total;
    private String nomplateau;
    private int nbrScene;
    private int idpersonnage;
    private int filmidfilm;
    @Id
    private int id;
    private int idplateau;
    private Timestamp dateprepa;

    @Transient
    private Time reste = null;

    public Planing() {
    }

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

    public int getFilmidfilm() {
        return filmidfilm;
    }

    public void setFilmidfilm(int filmidfilm) {
        this.filmidfilm = filmidfilm;
    }

    public int getIdplateau() {
        return idplateau;
    }

    public void setIdplateau(int idplateau) {
        this.idplateau = idplateau;
    }

    public ArrayList<Planing> suggestion(ArrayList<Planing> liste, ArrayList<indispoActeur> acteur, ArrayList<indispoPlateau> plateau, Date debut, Date fin) {
        ArrayList<Planing> result = new ArrayList<>();
        ArrayList<Planing> plan = liste;

        TimeClass duree = new TimeClass(0, 0, 0);
        Timestamp tp = new Timestamp(debut.getYear(), debut.getMonth(), debut.getDate(), 8, 0, 0, 0);
        TimestampClass daterealisation = new TimestampClass(tp.getTime());
        Time time = new Time(0);
        Calendar cl = Calendar.getInstance();
        cl.isWeekDateSupported();

        System.out.println("Date realisation = " + daterealisation + " jsq = " + fin);
        while (daterealisation.before(fin)) {
            for (int i = 0; (i < plan.size() && daterealisation.before(fin)); i++) {
                Time t = new Time(plan.get(i).getDateprepa().getTime());
                while (duree.getHours() < 9 && i < plan.size() && daterealisation.before(fin)) {
                    Planing planing = plan.get(i);
                    indispoActeur act = new indispoActeur(planing.getIdpersonnage(), daterealisation.toDate());
                    indispoPlateau plat = new indispoPlateau(planing.getIdplateau(), daterealisation.toDate());
                    System.out.println("Result compare = " + plat.estIndisponible(plateau));
                    if (plat.estIndisponible(plateau) == false && act.estIndisponible(acteur) == false && result.contains(planing) == false) {
                        int reste = 0;
                        if (duree.getHours() + planing.getTotal().getHours() > 9) {
                            reste = duree.getHours() + planing.getTotal().getHours() - 9;
                            // System.out.println("Misy reste = " + reste);
                            if (plan.get(i).getIdplateau() == plan.get(i + 1).getIdplateau()) {
                                plan.get(i + 1).getTotal().setHours(reste);;
                                plan.get(i).getTotal().setHours(8);
                            }
                            plan.get(i).setDateprepa(new Timestamp(daterealisation.getTime()));
                            result.add(plan.get(i));
                            time = new Time(time.getTime() + plan.get(i).getTotal().getTime());
                            planing.setDateprepa(add(planing.getDateprepa(), duree));
                            duree.add(new Time(8, 0, 0));
                            duree = new TimeClass(0, 0, 0);
                            daterealisation.setDate(daterealisation.getDate() + 1);
                        } else {
                            plan.get(i).setDateprepa(new Timestamp(daterealisation.getTime()));
                            result.add(plan.get(i));
                            planing.setDateprepa(add(planing.getDateprepa(), duree));
                            duree.add(plan.get(i).getTotal());
                        }
//                    System.out.println("" + planing.getNomplateau() + " date preparation " + planing.getDateprepa() + " duree" + planing.getTotal());
//                    System.out.println("Duree total = " + duree);
                        i++;
//                    System.out.println("Total time = " + time);
                    } else {
                        i++;
                    }
                }
//            System.out.println("Mivoka ny boucle");
                duree = new TimeClass(0, 0, 0);
                daterealisation.setDate(daterealisation.getDate() + 1);
            }
        }
        return result;
    }

    public ArrayList<Planing> suggestion2(ArrayList<Planing> liste, ArrayList<indispoActeur> acteur, ArrayList<indispoPlateau> plateau) {
        ArrayList<Planing> result = new ArrayList<>();
        ArrayList<Planing> plan = liste;

        TimeClass duree = new TimeClass(0, 0, 0);
        TimestampClass daterealisation = new TimestampClass(2023 - 1900, 03 - 1, 15, 8, 0, 0, 0);
        Time time = new Time(0);

        System.out.println("Date realisation = " + daterealisation + " jsq = ");

        for (int i = 0; i < plan.size(); i++) {
            Time t = new Time(plan.get(i).getDateprepa().getTime());

            while (duree.getHours() < 9 && i < plan.size()) {
                Planing planing = plan.get(i);
                int reste = 0;
                if (duree.getHours() + planing.getTotal().getHours() > 9) {
                    reste = duree.getHours() + planing.getTotal().getHours() - 9;
                    System.out.println("Misy reste = " + reste);
                    if (plan.get(i).getIdplateau() == plan.get(i + 1).getIdplateau()) {
                        plan.get(i + 1).getTotal().setHours(reste);;
                        plan.get(i).getTotal().setHours(8);

                    }

                    plan.get(i).setDateprepa(new Timestamp(daterealisation.getTime()));
                    result.add(plan.get(i));
                    time = new Time(time.getTime() + plan.get(i).getTotal().getTime());
                    planing.setDateprepa(add(planing.getDateprepa(), duree));
                    duree.add(new Time(8, 0, 0));

                    duree = new TimeClass(0, 0, 0);
                    daterealisation.setDate(daterealisation.getDate() + 1);

                } else {
                    plan.get(i).setDateprepa(new Timestamp(daterealisation.getTime()));
                    result.add(plan.get(i));
                    planing.setDateprepa(add(planing.getDateprepa(), duree));
                    duree.add(plan.get(i).getTotal());

                }

                System.out.println("" + planing.getNomplateau() + " date preparation " + planing.getDateprepa() + " duree" + planing.getTotal());
                System.out.println("Duree total = " + duree);
                i++;
                System.out.println("Total time = " + time);
            }
            System.out.println("Mivoka ny boucle");
            duree = new TimeClass(0, 0, 0);
            daterealisation.setDate(daterealisation.getDate() + 1);
        }

        return result;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDateprepa() {
        return dateprepa;
    }

    public void setDateprepa(Timestamp dateprepa) {
        this.dateprepa = dateprepa;
    }

    public Time getReste() {
        return reste;
    }

    public void setReste(Time reste) {
        this.reste = reste;
    }

    public Timestamp add(Timestamp times, Time time) {
        Timestamp temp = new Timestamp(times.getTime());
        temp.setHours(time.getHours() + temp.getHours());
        temp.setMinutes(time.getMinutes() + temp.getMinutes());
        temp.setSeconds(time.getSeconds() + temp.getSeconds());

        return temp;
    }

    public boolean verif(ArrayList<Object> liste, Date date, int idp) {
        ArrayList<Object> pl = new ArrayList<>();

        if (pl.size() > 0) {

            return false;
        }

        return true;
    }

    public int getIdpersonnage() {
        return idpersonnage;
    }

    public void setIdpersonnage(int idpersonnage) {
        this.idpersonnage = idpersonnage;
    }

}
