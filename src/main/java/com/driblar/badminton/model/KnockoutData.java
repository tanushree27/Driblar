package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class KnockoutData {
    private String[][] teams;
    private Integer[][] results;

    public KnockoutData(int players){
        if(players%2 == 1)
            players++;
        this.teams = new String[players/2][2];



    }
}
