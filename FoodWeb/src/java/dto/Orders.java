/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author Tan Phat
 */
public class Orders {
    private int id;
    private int accountId;
    private Date orderDate;
    private Date shipDate;
    private String shipAddress;
    private Short shipCityId;
    private Short shipDistrictId;
    private Short shipWardId;
    private BigDecimal totalPrice;
    private String customerNotes;
    private boolean status;

    public Orders() {
    }

    public Orders(int id, int accountId, Date orderDate, Date shipDate, String shipAddress, Short shipCityId, Short shipDistrictId, Short shipWardId, BigDecimal totalPrice, String customerNotes, boolean status) {
        this.id = id;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.shipAddress = shipAddress;
        this.shipCityId = shipCityId;
        this.shipDistrictId = shipDistrictId;
        this.shipWardId = shipWardId;
        this.totalPrice = totalPrice;
        this.customerNotes = customerNotes;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
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

    public Short getShipCityId() {
        return shipCityId;
    }

    public void setShipCityId(Short shipCityId) {
        this.shipCityId = shipCityId;
    }

    public Short getShipDistrictId() {
        return shipDistrictId;
    }

    public void setShipDistrictId(Short shipDistrictId) {
        this.shipDistrictId = shipDistrictId;
    }

    public Short getShipWardId() {
        return shipWardId;
    }

    public void setShipWardId(Short shipWardId) {
        this.shipWardId = shipWardId;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCustomerNotes() {
        return customerNotes;
    }

    public void setCustomerNotes(String customerNotes) {
        this.customerNotes = customerNotes;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
