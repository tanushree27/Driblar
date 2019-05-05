package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Setter @Getter
public class KnockoutData {
    private List<List<String>> teams = new ArrayList<>();;
    private List<List<List<List<Integer>>>> results = new ArrayList<>();

    public void evalKnockoutData(List<Player> players, int playersNum){
        int i = 0;
        teams.clear();

        while (i < playersNum) {
            String t1, t2;
            if (i < players.size())
                t1 = players.get(i).getName() == null ? "Player "+players.get(i).getId() : players.get(i).getName();
            else
                t1 = "TBD "+i;
            i++;

            if (i < players.size())
                t2 = players.get(i).getName() == null ? "Player "+players.get(i).getId() : players.get(i).getName();
            else if (i == playersNum)
                t2 = null;
            else
                t2 = "TBD "+i;
            i++;

            teams.add(new ArrayList<String>(Arrays.asList(t1, t2)));
        }
    }
}
