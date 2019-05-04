package com.driblar.badminton.controller;

import com.driblar.badminton.model.CustomResponse;
import com.driblar.badminton.model.Tournament;
import com.fasterxml.jackson.databind.JsonSerializable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RequestMapping("/")
@Controller
public class MainController {

    private Tournament tournament = new Tournament(24, 6);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getHomePage (ModelMap model) {
        return "home";
    }

    @RequestMapping(value = "/create/tournament", method = RequestMethod.POST)
    public String createTournament (@RequestParam Map<String, String> requestData, ModelMap model, HttpServletRequest request) {

        String name = requestData.get("tournamentName");
        int numberOfPlayers = Integer.parseInt(requestData.get("playersSize"));
        int pools = Integer.parseInt(requestData.get("poolSize"));

        tournament = new Tournament(numberOfPlayers, pools);
        tournament.setName(name);
        model.addAttribute("tournament", tournament);

        System.out.println(name);
        return "redirect:/tournament";
    }


    @ResponseBody
    @RequestMapping(value = "/save/name", method = RequestMethod.POST)
    public CustomResponse saveName (@RequestBody Map<String, String> requestData, ModelMap model, HttpServletRequest request) {


        int id = Integer.parseInt(requestData.get("id"));
        String name = requestData.get("name");

        System.out.println(name);
        tournament.getPlayers().get(id - 1).setName(name);

        return new CustomResponse(name);
    }

    @RequestMapping(value = "tournament", method = RequestMethod.GET)
    public String getTournamentPage (ModelMap model) {
        model.addAttribute("tournament", tournament);
        if (tournament == null)
            return "redirect:/";
        return "tournament";
    }

    @RequestMapping(value = "stage/roundrobin", method = RequestMethod.GET)
    public String getRoundRobinPage  (@RequestParam Map<String, String> requestData, ModelMap model) {

        if (tournament == null)
            return "redirect:/";

        model.addAttribute("poolsSize", tournament.getRoundRobinStage().getPools().size());

        int poolNumber = 0;

        if (requestData.containsKey("poolNum"))
           poolNumber = Integer.parseInt(requestData.get("poolNum")) - 1;

        model.addAttribute("selectPool", poolNumber + 1);
        model.addAttribute("pool", tournament.getRoundRobinStage().getPools().get(poolNumber));

        return "roundrobin";
    }


}
