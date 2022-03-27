package models;

public class Room extends Facility {
    private String freeService;

    public Room(String freeService) {
        this.freeService = freeService;
    }

    public Room(int idFacility, String name, double price, String rentalType, String usableArea, String freeService) {
        super(idFacility, name, price, rentalType, usableArea);
        this.freeService = freeService;
    }

    public Room() {
    }

    public String getFreeService() {
        return this.freeService;
    }

    public void setFreeService(String freeService) {
        this.freeService = freeService;
    }

    public String toString() {
        return super.toString() + "freeService='" + this.freeService + '\'';
    }
}
