package com.driblar.badminton.model;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Player {

    private int id;

    private String name;

    private int age;

    public Player (int id) {
        this.id = id;
    }

}
