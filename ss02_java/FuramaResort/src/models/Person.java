package models;

public abstract class Person {
    private int id;
    private String name;
    private int age;
    private String address;
    private int idCard;
    private String email;

    public Person() {
    }

    public Person(int id, String name, int age, String address, int idCard, String email) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.address = address;
        this.idCard = idCard;
        this.email = email;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return this.age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIdCard() {
        return this.idCard;
    }

    public void setIdCard(int idCard) {
        this.idCard = idCard;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String toString() {
        return "Person{id=" + this.id + ", name='" + this.name + '\'' + ", age=" + this.age + ", address='" + this.address + '\'' + ", idCard=" + this.idCard + ", email='" + this.email + '\'' + '}';
    }
}
