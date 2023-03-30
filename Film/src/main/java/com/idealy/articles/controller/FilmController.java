/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.controller;

import com.idealy.articles.model.Film;
import com.idealy.articles.model.Personnage;
import com.idealy.articles.model.Planing;
import com.idealy.articles.model.Plateau;
import com.idealy.articles.model.Scene;
import com.idealy.articles.model.SceneDescription;
import com.idealy.articles.model.SceneDetail;
import com.idealy.articles.model.Scene_Personnage;
import com.idealy.articles.model.indispoActeur;
import com.idealy.articles.model.indispoPlateau;
import hibernate.dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
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
    @GetMapping("/Articles")
    public String list(Model model) {

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
        ArrayList<Scene> scene = (ArrayList<Scene>) dao.findAll(Scene.class);

        model.addAttribute("scene", scene);

        return "ChoixDate";

    }
    @GetMapping("/Mapplateau")
    public String Mapplateau(Model model) {
        return "map";

    }

    @RequestMapping(value = "/ResultPlaning", method = RequestMethod.POST)
    public String ResultPlaning(Model model,
            @RequestParam(name = "id", required = true) int idfilm,
            @RequestParam(name = "datedebut", required = true) Date datedebut,
            @RequestParam(name = "datefin", required = true) Date datefin,
            @RequestParam(name = "liste", required = true) String[] liste
    ) {
        Date temp1 = new Date(121231);
        Date temp2 = new Date(12123100);

        ArrayList<Planing> planing = (ArrayList<Planing>) dao.getSuggestion(Planing.class, idfilm, liste);
        ArrayList<indispoActeur> acteur = (ArrayList<indispoActeur>) dao.indispo(indispoActeur.class, datedebut, datefin);
        ArrayList<indispoPlateau> plateau = (ArrayList<indispoPlateau>) dao.indispo(indispoPlateau.class, datedebut, datefin);

        model.addAttribute("Detail", new Planing().suggestion(planing, acteur, plateau, datedebut, datefin));

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
    @GetMapping("/ScenePlanifie")
    public String ScenePlanifie(Model model,
            @RequestParam(name = "idScene", required = true) int idScene) {
        
  
        ArrayList<Scene_Personnage> liste = (ArrayList<Scene_Personnage>) dao.ListPlanifie(Scene_Personnage.class,idScene );

        model.addAttribute("liste",liste);
        return "ListePlanifie";

    }
    

    @RequestMapping(value = "/ValiderPlaning", method = RequestMethod.POST)
    public String ValiderPlaning(Model model,
            @RequestParam(name = "idScene", required = true) String[] idScene) {
        SceneDetail detail = new SceneDetail();
        List<String> detailSceneSucces = new ArrayList<String>();
        
        for (int i = 0; i < idScene.length; i++) {
            String[] data = idScene[i].split("//");
            int id = Integer.parseInt(data[0]);
            int idacteur = Integer.parseInt(data[1]);
            int idplateau = Integer.parseInt(data[2]);
            String[] tempDate = data[3].split("-");
            Date date = new Date(Integer.parseInt(tempDate[0])-1900, Integer.parseInt(tempDate[1])-1, Integer.parseInt(tempDate[2]));

            System.out.println("Liste === " + idScene[i]);
            Scene_Personnage pers = dao.findById(Scene_Personnage.class, id);
            indispoActeur acteur = new indispoActeur(idacteur, date);
            indispoPlateau plateau = new indispoPlateau(idplateau, date);
            pers.setStatus(1);
            dao.create(acteur);
            dao.create(plateau);
            dao.update(pers);
            System.out.println("acteur = "+ idacteur);
            System.out.println("Humeur = "+ pers.getHumeur());
            System.out.println("text = " + pers.getText());
            System.out.println("plateau = "+ idplateau);
            System.out.println("date = "+ data[3].toString());
            System.out.println("Heur = "+ pers.getDurree().toString());
            
            
            detailSceneSucces.add("acteur = "+ idacteur +"<br> Humeur= "+pers.getHumeur()+"<br> text = "+pers.getText()+"<br> plateau= "+ idplateau +"<br> date= "+data[3].toString()+"<br> Heur ="+pers.getDurree().toString());
        }

        model.addAttribute("Detail", detailSceneSucces);
        // return "";
        return "Succes";

    }

}
