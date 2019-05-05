package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class KnockoutStage {

    private List<Player> players;

    private int numberOfPlayers;

    private KnockoutData knockoutData;

    private boolean lockBracket = false;

    public KnockoutStage (int numberOfPlayers, List<Player> players) {
        this.players = players;
        this.numberOfPlayers = numberOfPlayers;

        knockoutData = new KnockoutData();
        knockoutData.evalKnockoutData(players, numberOfPlayers);
    }

    public KnockoutData getKnockoutData () {

        knockoutData.evalKnockoutData(players, numberOfPlayers);
        return knockoutData;
    }
}
