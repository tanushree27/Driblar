package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class KnockoutStage {

    private List<Player> players;

    private int numberOfPlayers;

    public KnockoutStage (int numberOfPlayers) {
        this.numberOfPlayers = numberOfPlayers;
    }
}
