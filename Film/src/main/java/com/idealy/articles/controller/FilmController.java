/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.controller;

import com.idealy.articles.model.Film;
import com.idealy.articles.model.Personnage;
import com.idealy.articles.model.Plateau;
import com.idealy.articles.model.Scene;
import com.idealy.articles.model.SceneDescription;
import com.idealy.articles.model.SceneDetail;
import com.idealy.articles.model.Scene_Personnage;
import hibernate.dao.HibernateDao;
import java.sql.Time;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author 26132
 */
@Controller
public class FilmController {

    @Autowired
    HibernateDao dao;

    @GetMapping("/ListeFilms")
    public String listDemande(Model model) {

        model.addAttribute("ListesFilms", dao.findAll(Film.class));
        return "ListeFilms";

    }

    @GetMapping("/DetailFilm")
    public String DetailFilm(Model model,
            @RequestParam(name = "id", required = true) int id) {

        model.addAttribute("ListesScene", dao.getDetailFilm(Scene.class, id));
        return "DetailFilm";

    }

    @GetMapping("/Planing")
    public String Planing(Model model,
            @RequestParam(name = "id", required = true) int idfilm) {

        model.addAttribute("Detail", dao.getSuggestion(SceneDescription.class, idfilm));

        return "Planing";

    }

    @RequestMapping(value = "/AddScene", method = RequestMethod.POST)
    public String AddScene(Model model,
            @RequestParam(name = "idfilm", required = true) int idfilm,
            @RequestParam("titre") String titre,
            @RequestParam("numero") int numero,
            @RequestParam("resume") String resume,
            @RequestParam("photo") String photo
    ) {

        Scene sc = new Scene();
        sc.setIdFilm(idfilm);
        sc.setNomScene(titre);
        sc.setNumero(numero);
        sc.setResume(resume);
        sc.setPhoto(photo);
        dao.create(sc);

        model.addAttribute("ListesScene", dao.getDetailFilm(Scene.class, idfilm));

        model.addAttribute("id", String.valueOf(idfilm));

        return "DetailFilm";

    }

    @RequestMapping(value = "/AddDetail", method = RequestMethod.POST)
    public String AddDetail(Model model,
            @RequestParam(name = "idfilm", required = true) int idfilm,
            @RequestParam("perso") int perso,
            @RequestParam("plateau") int plateau,
            @RequestParam("duree") String duree,
            @RequestParam("text") String text,
            @RequestParam("humeur") String humeur
    ) {

        Scene_Personnage sp = new Scene_Personnage();
        sp.setDurree(Time.valueOf(duree));
        sp.setHumeur(humeur);
        sp.setIdPlateau(plateau);
        sp.setText(text);
        sp.setSceneidscene(idfilm);
        sp.setPersonnageidPersonnage(perso);
        dao.create(sp);

        model.addAttribute("plateau", dao.findAll(Plateau.class));
        model.addAttribute("Perso", dao.findAll(Personnage.class));
        model.addAttribute("Detail", dao.getDetailScene(SceneDetail.class, idfilm));
        model.addAttribute("idScene", String.valueOf(idfilm));
        System.out.println("Atoooooooo");
        return "DetailScene";

    }

    @GetMapping("/DetailPlateau")
    public String DetailPlateau(Model model,
            @RequestParam(name = "idfilm", required = true) int idfilm,
            @RequestParam(name = "idplateau", required = true) int idplateau) {
        SceneDetail detail = new SceneDetail();
        detail.setFilmidfilm(idfilm);
        detail.setIdplateau(idplateau);

        List ls = dao.findWhere(detail);
        System.out.println("Taille liste = " + ls.size());
        model.addAttribute("Detail", dao.getDetail(detail.getClass(), idfilm, idplateau));

        return "DetailPlateau";

    }

    @GetMapping("/DetailScene")
    public String DetailScene(Model model,
            @RequestParam(name = "idScene", required = true) int idScene) {
        SceneDetail detail = new SceneDetail();
        detail.setSceneidscene(idScene);
        List ls = dao.findWhere(detail);
        System.out.println("Taille liste = " + ls.size());

        model.addAttribute("plateau", dao.findAll(Plateau.class));
        model.addAttribute("Perso", dao.findAll(Personnage.class));
        model.addAttribute("Detail", dao.getDetailScene(detail.getClass(), idScene));

        return "DetailScene";

    }

}