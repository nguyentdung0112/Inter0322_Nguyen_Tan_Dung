package models;

public class Contract {
    private String bookingCode;
    private int deposit;
    private int totalBookingValue;
    private String customerId;

    public Contract() {
    }

    public Contract(String bookingCode, int deposit, int totalBookingValue, String customerId) {
        this.bookingCode = bookingCode;
        this.deposit = deposit;
        this.totalBookingValue = totalBookingValue;
        this.customerId = customerId;
    }

    public String getBookingCode() {
        return this.bookingCode;
    }

    public void setBookingCode(String bookingCode) {
        this.bookingCode = bookingCode;
    }

    public int getDeposit() {
        return this.deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    public int getTotalBookingValue() {
        return this.totalBookingValue;
    }

    public void setTotalBookingValue(int totalBookingValue) {
        this.totalBookingValue = totalBookingValue;
    }

    public String getCustomerId() {
        return this.customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String toString() {
        return "Contract{bookingCode='" + this.bookingCode + '\'' + ", deposit=" + this.deposit + ", totalBookingValue=" + this.totalBookingValue + ", customerId='" + this.customerId + '\'' + '}';
    }
}
