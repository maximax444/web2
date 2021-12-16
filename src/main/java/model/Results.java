package model;


import java.util.*;

public class Results {
    private List<Shoot> shootsList;

    public Results() {
        this.shootsList = new ArrayList<>();
    }
    public Results(List<Shoot> shootsList) {
        this.shootsList = shootsList;
    }
    public Results(Shoot shoot) {
        this.shootsList = new ArrayList<>();
        this.shootsList.add(shoot);
    }

    public List<Shoot> getShootsList() {
        return shootsList;
    }

    public void setShootsList(List<Shoot> shootsList) {
        this.shootsList = shootsList;
    }

    @Override
    public String toString() {
        return "Results{" +
                "shootsList=" + shootsList.toString() +
                '}';
    }
}
