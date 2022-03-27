package models;

public class Employee extends Person {
    private String level;
    private String salary;
    private String position;

    public Employee(String level, String salary, String position) {
        this.level = level;
        this.salary = salary;
        this.position = position;
    }

    public Employee(int id, String name, int age, String address, int idCard, String email, String level, String salary, String position) {
        super(id, name, age, address, idCard, email);
        this.level = level;
        this.salary = salary;
        this.position = position;
    }

    public String getLevel() {
        return this.level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getSalary() {
        return this.salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return this.position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String toString() {
        return super.toString() + "level='" + this.level + '\'' + ", salary='" + this.salary + '\'' + ", position='" + this.position + '\'' + '}';
    }
}
