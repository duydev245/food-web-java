/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author Tan Phat
 */
public class Order {

    private int orderId;
    private String accountName;
    private Date oderDate;
    private Date shipDate;
    private String shipAddress;
    private String shipCity;
    private String shipDistric;
    private String shipWard;
    private double totalPrice;
    private String customerNote;
    private boolean satus;

    public Order() {
    }

    public Order(int orderId, String accountName, Date oderDate, Date shipDate, String shipAddress, String shipCity, String shipDistric, String shipWard, double totalPrice, String customerNote, boolean satus) {
        this.orderId = orderId;
        this.accountName = accountName;
        this.oderDate = oderDate;
        this.shipDate = shipDate;
        this.shipAddress = shipAddress;
        this.shipCity = shipCity;
        this.shipDistric = shipDistric;
        this.shipWard = shipWard;
        this.totalPrice = totalPrice;
        this.customerNote = customerNote;
        this.satus = satus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Date getOderDate() {
        return oderDate;
    }

    public void setOderDate(Date oderDate) {
        this.oderDate = oderDate;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipCity() {
        return shipCity;
    }

    public void setShipCity(String shipCity) {
        this.shipCity = shipCity;
    }

    public String getShipDistric() {
        return shipDistric;
    }

    public void setShipDistric(String shipDistric) {
        this.shipDistric = shipDistric;
    }

    public String getShipWard() {
        return shipWard;
    }

    public void setShipWard(String shipWard) {
        this.shipWard = shipWard;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCustomerNote() {
        return customerNote;
    }

    public void setCustomerNote(String customerNote) {
        this.customerNote = customerNote;
    }

    public boolean isSatus() {
        return satus;
    }

    public void setSatus(boolean satus) {
        this.satus = satus;
    }

    

}
