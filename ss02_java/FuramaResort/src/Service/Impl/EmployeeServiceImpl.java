package Service.Impl;

import Service.EmployeeService;
import models.Customer;
import models.Employee;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EmployeeServiceImpl implements EmployeeService {

    private static List<Employee>employeeList= new ArrayList<>();
    private static Scanner scanner= new Scanner(System.in);

    public Employee getEmployee(){
        System.out.println("Nhập id");
        int id = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập tên");
        String name = scanner.nextLine();
        System.out.println("nhập tuổi");
        int age = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập địa chỉ");
        String address = scanner.nextLine();
        System.out.println("Nhập CMND");
        int idCard = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập Email");
        String email = scanner.nextLine();
        System.out.println("Nhap chức vụ");
        String level = scanner.nextLine();
        System.out.println("Nhập lương");
        String salary = scanner.nextLine();
        System.out.println("Nhập vị trí");
        String position = scanner.nextLine();

        return new Employee(id, name, age, address, idCard,
                email, level, salary, position);

    }

    @Override
    public void display() {
        for(Employee o:employeeList){
            System.out.println(o.toString());
        }


    }

    @Override
    public void addNew() {
        Employee employee=getEmployee();
        employeeList.add(employee);


    }

    @Override
    public void edit() {
        boolean check=true;
        System.out.println("nhap id can update");
        int id= Integer.parseInt(scanner.nextLine());
        for(int i =0; i<employeeList.size();i++){
            if(id==employeeList.get(i).getId()){
                System.out.println(employeeList.get(i).toString());

                employeeList.add(i, getEmployee());

                employeeList.remove(i+1);
            }


        }
        if(check){
            System.out.println("Không tìm thấy ID");
        }


    }

    @Override
    public void delete() {

    }
}
