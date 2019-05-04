package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class RoundRobinStage extends Stage {

    private List<Pool> pools;

    @Override
    public List<Player> getTop(int top) {
        return null;
    }

    RoundRobinStage (List<Player> players, int numberOfPools) {
        pools = new ArrayList<>();

        for (int i = 0; i < numberOfPools; i++)
            pools.add(new Pool(players.subList(i * players.size()/numberOfPools, (i + 1) * players.size()/numberOfPools)));

    }
}