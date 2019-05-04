package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Match {
    private Player player1, player2;

    private Player winner;

    public Match (Player p1, Player p2) {
        player1 = p1;
        player2 = p2;
    }
}
