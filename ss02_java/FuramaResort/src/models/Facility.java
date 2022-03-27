package models;

public abstract class Facility {
    private int idFacility;
    private String name;
    private double price;
    private String rentalType;
    private String usableArea;

    public Facility() {
    }

    public Facility(int idFacility, String name, double price, String rentalType, String usableArea) {
        this.name = name;
        this.price = price;
        this.rentalType = rentalType;
        this.usableArea = usableArea;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRentalType() {
        return this.rentalType;
    }

    public void setRentalType(String rentalType) {
        this.rentalType = rentalType;
    }

    public String getUsableArea() {
        return this.usableArea;
    }

    public void setUsableArea(String usableArea) {
        this.usableArea = usableArea;
    }

    public int getIdFacility() {
        return this.idFacility;
    }

    public void setIdFacility(int idFacility) {
        this.idFacility = idFacility;
    }

    public String toString() {
        return "Facility{idFacility='" + this.idFacility + '\'' + ", name='" + this.name + '\'' + ", price=" + this.price + ", rentalType='" + this.rentalType + '\'' + ", usableArea='" + this.usableArea + '\'' + '}';
    }
}
