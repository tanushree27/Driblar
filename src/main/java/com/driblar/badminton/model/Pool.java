package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Getter @Setter
public class Pool {
    private List<Player> players;

    private List<Match> matches;

    private List<Player> sorted;

    private boolean complete = false;

    public Pool (List<Player> players){
        this.players = players;
        matches = new ArrayList<>();
        for (int i = 0; i < players.size() - 1; i++) {
            for (int j = i + 1; j < players.size(); j++)
                matches.add(new Match(players.get(i), players.get(j)));
        }
    }

    public void evalCompleted (int qualify) {
        for (Match match : this.matches) {
            if (match.getOutcome() == null) {
                this.complete = false;
                for (Player player: players) {
                    player.setQualified(false);
                }
                return;
            }
        }
        this.complete = true;

        sorted = new ArrayList<>(players);

        Collections.sort(sorted, Collections.<Player>reverseOrder());

        System.out.println("here");
        for (int i = 0; i < qualify; i++) {
            for (Player player : players) {
                if (player.getId() == sorted.get(i).getId())
                    player.setQualified(true);
            }
        }
    }

}
