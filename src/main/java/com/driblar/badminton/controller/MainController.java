package com.driblar.badminton.controller;

import com.driblar.badminton.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequestMapping("/")
@Controller
public class MainController {

    private Tournament tournament = new Tournament(12, 3, 2);

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
        model.addAttribute("bracketLocked", tournament.getKnockoutStage().isLockBracket());

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

        for (Player player : tournament.getPlayers()) {
            player.setPoints(0);
            player.getRoundrobinLoss(tournament.getRoundRobinStage());
            player.getRoundrobinTies(tournament.getRoundRobinStage());
            player.getRoundrobinWins(tournament.getRoundRobinStage());
        }

        List<Player> playerlist = new ArrayList<>();
        for (Pool pool : tournament.getRoundRobinStage().getPools())
            pool.evalCompleted(tournament.getRoundRobinStage().getNumberQualify());

        for(Player player: tournament.getPlayers())
        {
            if(player.isQualified()){
                playerlist.add(player);
            }
        }

        tournament.getKnockoutStage().setPlayers(playerlist);

    model.addAttribute("players", playerlist);
        model.addAttribute("knockout", tournament.getKnockoutStage());
        model.addAttribute("lockable", playerlist.size() == tournament.getKnockoutStage().getNumberOfPlayers() ? 1 : 0);

        return "knockout";
    }

    @ResponseBody
    @RequestMapping(value = "/get/knockout/data", method = RequestMethod.GET)
    public KnockoutData getKnockoutData (ModelMap model) {
        return tournament.getKnockoutStage().getKnockoutData();
    }


    @ResponseBody
    @RequestMapping(value = "/lock/bracket", method = RequestMethod.POST)
    public CustomResponse lockBracket (@RequestBody Map<String, String> requestData, ModelMap model) {
        tournament.getKnockoutStage().setLockBracket(true);
        return new CustomResponse("bracket locked");
    }


    @ResponseBody
    @RequestMapping(value = "/update/bracket", method = RequestMethod.POST)
    public CustomResponse updateBracket (@RequestBody KnockoutData data, ModelMap model) {
        tournament.getKnockoutStage().setKnockoutData(data);
        return new CustomResponse("bracket updated");
    }
}
