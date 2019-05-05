package com.driblar.badminton.model;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Player implements Comparable<Player>{

    private int id;

    private String name;

    private int age;

    private int roundRobinWins = 0;

    private int roundRobinLoss = 0;

    private int roundRobinTies = 0;

    private int points = 0;

    private boolean qualified = false;

    public Player (int id) {
        this.id = id;
    }

    public void incWins () { this.roundRobinWins += 1;}

    public void incLoss () { this.roundRobinLoss += 1;}

    public void inc () { this.roundRobinWins += 1;}

    public int getRoundrobinWins (RoundRobinStage roundRobinStage) {
        Pool pool = getPool(roundRobinStage);
        int count = 0;

        for (Match match : pool.getMatches()) {
            if (match.getPlayer1().getId() == this.id) {
                if (match.getOutcome() != null && match.getOutcome().equals(Match.Outcome.PLAYER1)) {
                    count++;
                }
            }else if (match.getPlayer2().getId() == this.id) {
                if (match.getOutcome() != null && match.getOutcome().equals(Match.Outcome.PLAYER2)) {
                    count++;
                }
            }
        }

        this.roundRobinWins = count;
        this.points += count * 2;

        return count;
    }

    public int getRoundrobinLoss (RoundRobinStage roundRobinStage) {
        Pool pool = getPool(roundRobinStage);
        int count = 0;

        for (Match match : pool.getMatches()) {
            if (match.getPlayer1().getId() == this.id) {
                if (match.getOutcome() != null && match.getOutcome().equals(Match.Outcome.PLAYER2)) {
                    count++;
                }
            }else if (match.getOutcome() != null && match.getPlayer2().getId() == this.id) {
                if (match.getOutcome().equals(Match.Outcome.PLAYER1)) {
                    count++;
                }
            }
        }

        this.roundRobinLoss = count;
        return count;
    }

    public int getRoundrobinTies (RoundRobinStage roundRobinStage) {
        Pool pool = getPool(roundRobinStage);
        int count = 0;

        for (Match match : pool.getMatches()) {
            if (match.getPlayer1().getId() == this.id || match.getPlayer2().getId() == this.id) {
                if (match.getOutcome() != null && match.getOutcome().equals(Match.Outcome.TIE)) {
                    count++;
                }
            }
        }

        this.roundRobinTies = count;
        this.points += count;
        return count;
    }

    private Pool getPool (RoundRobinStage roundRobinStage) {

        for (Pool poolIt : roundRobinStage.getPools()) {
            for (Match match: poolIt.getMatches()) {
                if (match.getPlayer1().getId() == this.id || match.getPlayer2().getId() == this.id)
                    return poolIt;
            }
        }

        return null;
    }

    @Override
    public int compareTo(Player o) {
        return Integer.compare(points, o.getPoints());
    }
}
