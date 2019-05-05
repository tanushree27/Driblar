package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class RoundRobinStage {

    private List<Pool> pools;

    private int numberQualify;

    RoundRobinStage (List<Player> players, int poolSize, int qualify) {
        pools = new ArrayList<>();
        this.numberQualify = qualify;

        for (int i = 0; (i + 1) * poolSize <= players.size(); i++) {

            int stIndex = i * poolSize;
            int edIndex = (i + 1) * poolSize;

            List<Player> poolPlayers = players.subList(stIndex, edIndex);

            pools.add(new Pool(poolPlayers));
        }
    }

}
