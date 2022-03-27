package models;

public class House extends Facility {
    private String roomStandard;
    private int numberOfFloors;

    public House(String roomStandard, int numberOfFloors) {
        this.roomStandard = roomStandard;
        this.numberOfFloors = numberOfFloors;
    }

    public House() {
    }

    public House(int idFacility, String name, double price, String rentalType, String usableArea, String roomStandard, int numberOfFloors) {
        super(idFacility, name, price, rentalType, usableArea);
        this.roomStandard = roomStandard;
        this.numberOfFloors = numberOfFloors;
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

    public String toString() {
        return super.toString() + "roomStandard='" + this.roomStandard + '\'' + ", numberOfFloors=" + this.numberOfFloors + '}';
    }
}
