package models;

import java.util.Date;

public class Booking {
    private String code;
    private Date checkIn;
    private Date checkOut;
    private String customerId;
    private String service;

    public Booking() {
    }

    public Booking(String code, Date checkIn, Date checkOut, String customerId, String service) {
        this.code = code;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.customerId = customerId;
        this.service = service;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getCheckIn() {
        return this.checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return this.checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public String getCustomerId() {
        return this.customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getService() {
        return this.service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String toString() {
        return "Booking{code='" + this.code + '\'' + ", checkIn=" + this.checkIn + ", checkOut=" + this.checkOut + ", customerId='" + this.customerId + '\'' + ", service='" + this.service + '\'' + '}';
    }
}
