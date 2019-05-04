package com.driblar.badminton.model;

import java.util.List;

public abstract class Stage {

    public enum Type { ROUND_ROBIN, KNOCKOUT};

    public Type type;

    public abstract List<Player> getTop(int top);

}
