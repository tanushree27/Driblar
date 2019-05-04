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

    RoundRobinStage (List<Player> players, int poolSize) {
        pools = new ArrayList<>();


        for (int i = 0; (i + 1) * poolSize <= players.size(); i++) {

            int stIndex = i * poolSize;
            int edIndex = (i + 1) * poolSize;

            List<Player> poolPlayers = players.subList(stIndex, edIndex);

            pools.add(new Pool(poolPlayers));
        }
    }

}
