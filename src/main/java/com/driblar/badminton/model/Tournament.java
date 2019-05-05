package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Setter @Getter
public class Tournament {

    private String name;

    private int playersSize;

    private List<Player> players;

    private RoundRobinStage roundRobinStage;

    private KnockoutStage knockoutStage;

    public Tournament (int participants, int pools, int qualify) {
        this.playersSize = participants;

        players = new ArrayList<>();
        for (int i = 0; i < participants; i++)
            players.add(new Player(i+1));

        roundRobinStage = new RoundRobinStage(players, pools, qualify);

        knockoutStage = new KnockoutStage((participants/pools) * qualify);

    }

}
