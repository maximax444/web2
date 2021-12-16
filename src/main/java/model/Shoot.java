package model;

public class Shoot {
    private double x;
    private double y;
    private double r;
    private boolean result;
    private String localTime;
    private double processingTime;

    public Shoot(double x, double y, double r, boolean result, String localTime, double processingTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.result = result;
        this.localTime = localTime;
        this.processingTime = processingTime;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public void setLocalTime(String localTime) {
        this.localTime = localTime;
    }

    public void setProcessingTime(double processingTime) {
        this.processingTime = processingTime;
    }

    public double getX() {
        return x;
    }
    public double getY() {
        return y;
    }
    public double getR() {
        return r;
    }
    public boolean getResult() {
        return result;
    }
    public String getLocalTime() {
        return localTime;
    }
    public double getProcessingTime() {
        return processingTime;
    }

    @Override
    public String toString() {
        return "Shoot{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", result=" + result +
                ", localTime='" + localTime + '\'' +
                ", processingTime=" + processingTime +
                '}';
    }
}
