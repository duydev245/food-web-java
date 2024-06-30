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
public class Dishes {

    private short id;
    private String name;
    private BigDecimal price;
    private Boolean status;
    private String description;
    private byte[] image;

    public Dishes() {
    }

    public Dishes(short id, String name, BigDecimal price, Boolean status, String description, byte[] image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.status = status;
        this.description = description;
        this.image = image;
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Boolean isStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

}
