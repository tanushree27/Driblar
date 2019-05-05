package com.driblar.badminton.controller;

import com.driblar.badminton.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Map;

@RequestMapping("/")
@Controller
public class MainController {

    private Tournament tournament = new Tournament(24, 6, 2);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getHomePage (ModelMap model) {
        return "home";
    }

    @RequestMapping(value = "/create/tournament", method = RequestMethod.POST)
    public String createTournament (@RequestParam Map<String, String> requestData, ModelMap model, HttpServletRequest request) {

        String name = requestData.get("tournamentName");
        int numberOfPlayers = Integer.parseInt(requestData.get("playersSize"));
        int pools = Integer.parseInt(requestData.get("poolSize"));
        int advanceSize = Integer.parseInt(requestData.get("advanceSize"));

        tournament = new Tournament(numberOfPlayers, pools, advanceSize);
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
        if (tournament == null)
            return "redirect:/";

        for (Player player : tournament.getPlayers()) {
            player.setPoints(0);
            player.getRoundrobinLoss(tournament.getRoundRobinStage());
            player.getRoundrobinTies(tournament.getRoundRobinStage());
            player.getRoundrobinWins(tournament.getRoundRobinStage());
        }

        for (Pool pool : tournament.getRoundRobinStage().getPools())
            pool.evalCompleted(tournament.getRoundRobinStage().getNumberQualify());

        System.out.println("qualified " +tournament.getRoundRobinStage().getNumberQualify());
        model.addAttribute("tournament", tournament);


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

    @ResponseBody
    @RequestMapping(value = "/match/winner", method = RequestMethod.POST)
    public CustomResponse saveMatchWinner (@RequestBody Map<String, String> requestData, ModelMap model, HttpServletRequest request) {

        int pool = Integer.parseInt(requestData.get("pool")) - 1;
        int matchIn = Integer.parseInt(requestData.get("match"));
        int player = Integer.parseInt(requestData.get("player"));

        Match match = tournament.getRoundRobinStage().getPools().get(pool).getMatches().get(matchIn);

        if (player == 1)
            match.setOutcome(Match.Outcome.PLAYER1);
        else if (player == 2)
            match.setOutcome(Match.Outcome.PLAYER2);
        else
            match.setOutcome(Match.Outcome.TIE);


        return new CustomResponse("success");
    }

    @RequestMapping(value = "stage/knockout", method = RequestMethod.GET)
    public String getKnockoutPage  (@RequestParam Map<String, String> requestData, ModelMap model) {

        if (tournament == null)
            return "redirect:/";

        return "knockout";
    }
}
