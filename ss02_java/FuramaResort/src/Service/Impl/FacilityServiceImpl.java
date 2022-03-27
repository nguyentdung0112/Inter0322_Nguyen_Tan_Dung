package Service.Impl;

import Service.FacilityService;
import models.Facility;
import models.House;
import models.Room;
import models.Villa;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class FacilityServiceImpl implements FacilityService {
    private  static Map<Facility,Integer>facilityIntegerMap= new HashMap<>();
    private static Scanner scanner= new Scanner(System.in);
    @Override
    public void display() {
        for(Map.Entry<Facility,Integer> e:facilityIntegerMap.entrySet()) {
            System.out.println("Service" + e.getKey()+"so lan thue "+ e.getValue());
        }

    }
//    String idFacility,String name, double price, String rentalType,
//    String usableArea, String roomStandard, int numberOfFloors, int poolArea

    @Override
    public void displayMaintain() {

    }

    @Override
    public void addNewVilla() {
        System.out.println("Nhap id");
        int idFacility=Integer.parseInt(scanner.nextLine());
        System.out.println("Nhap ten");
        String name=scanner.nextLine();
        System.out.println("Nhap gia");
        double price=Double.parseDouble(scanner.nextLine());
        System.out.println(" Kieu thue");
        String rentalType= scanner.nextLine();
        System.out.println("Dien tich su dung");
        String usableArea=scanner.nextLine();
        System.out.println("Tieu chuan phong");
        String roomStandard=scanner.nextLine();
        System.out.println("So tang");
        int numberOfFloors= Integer.parseInt(scanner.nextLine());
        System.out.println("Dien tich ho boi");
        int poolArea=Integer.parseInt(scanner.nextLine());

        Villa villa= new Villa(idFacility,name,price,rentalType,usableArea,roomStandard,numberOfFloors,poolArea);
        facilityIntegerMap.put(villa,0);
        System.out.println("Them thanh cong");



    }

    @Override
    public void addNewHouse() {
        System.out.println("Nhap id");
        int idFacility=Integer.parseInt(scanner.nextLine());
        System.out.println("Nhap ten");
        String name=scanner.nextLine();
        System.out.println("Nhap gia");
        double price=Double.parseDouble(scanner.nextLine());
        System.out.println(" Kieu thue");
        String rentalType= scanner.nextLine();
        System.out.println("Dien tich su dung");
        String usableArea=scanner.nextLine();
        System.out.println("Tieu chuan phong");
        String roomStandard=scanner.nextLine();
        System.out.println("So tang");
        int numberOfFloors= Integer.parseInt(scanner.nextLine());
        House house= new House(idFacility,name,price,rentalType,usableArea,roomStandard,numberOfFloors);
        facilityIntegerMap.put(house,0);



    }

    @Override
    public void addNewRoom() {
        System.out.println("Nhap id");
        int idFacility=Integer.parseInt(scanner.nextLine());
        System.out.println("Nhap ten");
        String name=scanner.nextLine();
        System.out.println("Nhap gia");
        double price=Double.parseDouble(scanner.nextLine());
        System.out.println(" Kieu thue");
        String rentalType= scanner.nextLine();
        System.out.println("Dien tich su dung");
        String usableArea=scanner.nextLine();
        System.out.println("Dich vu mien phi");
        String freeService=scanner.nextLine();

        Room room= new Room(idFacility,name,price,rentalType,usableArea,freeService);
        facilityIntegerMap.put(room,0);


    }
}
