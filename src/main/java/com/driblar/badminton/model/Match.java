package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Match {
    private Player player1, player2;

    public enum Outcome {PLAYER1, PLAYER2, TIE};

    private Outcome outcome;

    public Match (Player p1, Player p2) {
        player1 = p1;
        player2 = p2;
    }
}
