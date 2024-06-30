/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.math.BigDecimal;

/**
 *
 * @author Tan Phat
 */
public class Order_Details {
    private int orderId;
    private short dishId;
    private boolean itemType;
    private short quantity;
    private BigDecimal pricePerUnit;

    public Order_Details() {
    }

    public Order_Details(int orderId, short dishId, boolean itemType, short quantity, BigDecimal pricePerUnit) {
        this.orderId = orderId;
        this.dishId = dishId;
        this.itemType = itemType;
        this.quantity = quantity;
        this.pricePerUnit = pricePerUnit;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public short getDishId() {
        return dishId;
    }

    public void setDishId(short dishId) {
        this.dishId = dishId;
    }

    public boolean isItemType() {
        return itemType;
    }

    public void setItemType(boolean itemType) {
        this.itemType = itemType;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(BigDecimal pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }
    
}
