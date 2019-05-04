package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class Pool {
    private List<Player> players;

    private List<Match> matches;

    public Pool (List<Player> players){
        this.players = players;
        matches = new ArrayList<>();
        for (int i = 0; i < players.size() - 1; i++) {
            for (int j = i + 1; j < players.size(); j++)
                matches.add(new Match(players.get(i), players.get(j)));
        }
    }

}
