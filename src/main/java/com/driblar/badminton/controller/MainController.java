package com.driblar.badminton.controller;

import com.driblar.badminton.model.Tournament;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RequestMapping("/")
@Controller
public class MainController {

    private Tournament tournament;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String printHelloWorld (ModelMap model) {

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
        return "tournament";
    }
}
