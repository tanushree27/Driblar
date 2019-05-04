package com.driblar.badminton.model;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Player {

    private int id;

    private String name;

    private int age;

    private int roundRobinWins = 0;

    private int roundRobinLoss = 0;

    private int roundRobinTies = 0;

    public Player (int id) {
        this.id = id;
    }

}
