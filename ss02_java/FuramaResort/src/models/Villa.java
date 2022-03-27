package models;

public class Villa extends Facility {
    private String roomStandard;
    private int numberOfFloors;
    private int poolArea;

    public Villa() {
    }

    public Villa(String roomStandard, int numberOfFloors, int poolArea) {
        this.roomStandard = roomStandard;
        this.numberOfFloors = numberOfFloors;
        this.poolArea = poolArea;
    }

    public Villa(int idFacility, String name, double price, String rentalType, String usableArea, String roomStandard, int numberOfFloors, int poolArea) {
        super(idFacility, name, price, rentalType, usableArea);
        this.roomStandard = roomStandard;
        this.numberOfFloors = numberOfFloors;
        this.poolArea = poolArea;
    }

    public String getRoomStandard() {
        return this.roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    public int getNumberOfFloors() {
        return this.numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public int getPoolArea() {
        return this.poolArea;
    }

    public void setPoolArea(int poolArea) {
        this.poolArea = poolArea;
    }

    public String toString() {
        return super.toString() + "roomStandard='" + this.roomStandard + '\'' + ", numberOfFloors=" + this.numberOfFloors + ", poolArea=" + this.poolArea + '}';
    }
}
