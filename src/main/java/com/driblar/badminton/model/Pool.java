package com.driblar.badminton.model;

import java.util.ArrayList;
import java.util.List;

public class Pool {
    List<Player> players;
    List<Match> matches;

    public Pool (List<Player> players){
        this.players = players;
        matches = new ArrayList<>();
        for (int i = 0; i < players.size() - 1; i++) {
            for (int j = i + 1; j < players.size(); j++)
                matches.add(new Match(players.get(i), players.get(j)));
        }
    }
}
