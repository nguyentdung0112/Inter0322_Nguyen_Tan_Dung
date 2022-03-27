package Service.Impl;

import Service.CustomerService;

import models.Customer;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CustomerServiceImpl implements CustomerService {

    private static List<Customer>customerList=new ArrayList<>();
    private static Scanner scanner= new Scanner(System.in);
    public  Customer getCustomer(){
        System.out.println("Nhập id");
        int id=Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập tên");
        String name=scanner.nextLine();
        System.out.println("nhập tuổi");
        int age=Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập địa chỉ");
        String address=scanner.nextLine();
        System.out.println("Nhập CMND");
        int idCard=Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập Email");
        String email=scanner.nextLine();
        System.out.println("Loại khách hàng");
        String type=scanner.nextLine();

        return new Customer(id,name, age, address, idCard,
                email,type);
    }


    @Override
    public void display() {
        for (Customer o:customerList) {
            System.out.println(o.toString());


        }

    }

    @Override
    public void addNew() {
        Customer customer=getCustomer();
        customerList.add(customer);



    }

    @Override
    public void edit() {
        boolean check = true;
        System.out.print("input id element update: ");
        int id = Integer.parseInt(scanner.nextLine());
        for (int i = 0; i <customerList.size(); i++) {
            if (id==(customerList.get(i).getId())) {
                //xuất lại thông tin cũ
                System.out.println(customerList.get(i).toString());

                //nhập lại phần tử bạn muốn update
                customerList.add(i, getCustomer());
                //xoá phần tử tại vị trí index, vì sau khi thêm phần tử vào, thì phần tử cũ sẽ được đẩy lên index+1
                customerList.remove(i+1);
                check=true;

            }
        }
        if (check) {
            System.out.println("NOT FIND ID!");
        }


    }


    @Override
    public void delete() {

    }
}