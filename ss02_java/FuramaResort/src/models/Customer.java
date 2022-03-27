package models;

public class Customer extends Person {
    private String type;

    public Customer() {
    }

    public Customer(String type) {
        this.type = type;
    }

    public Customer(int id, String name, int age, String address, int idCard, String email, String type) {
        super(id, name, age, address, idCard, email);
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String toString() {
        return super.toString() + "type='" + this.type + '\'' + '}';
    }
}
