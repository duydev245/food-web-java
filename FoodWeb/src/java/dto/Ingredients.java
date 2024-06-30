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
public class Ingredients {

    public class Ingredient {

        private short id;
        private String name;
        private String unit;
        private BigDecimal price;
        private int totalQuantity;
        private String category;
        private String description;
        private Boolean status;
        private byte[] image;

        public Ingredient() {
        }

        public Ingredient(short id, String name, String unit, BigDecimal price, int totalQuantity, String category, String description, Boolean status, byte[] image) {
            this.id = id;
            this.name = name;
            this.unit = unit;
            this.price = price;
            this.totalQuantity = totalQuantity;
            this.category = category;
            this.description = description;
            this.status = status;
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

        public String getUnit() {
            return unit;
        }

        public void setUnit(String unit) {
            this.unit = unit;
        }

        public BigDecimal getPrice() {
            return price;
        }

        public void setPrice(BigDecimal price) {
            this.price = price;
        }

        public int getTotalQuantity() {
            return totalQuantity;
        }

        public void setTotalQuantity(int totalQuantity) {
            this.totalQuantity = totalQuantity;
        }

        public String getCategory() {
            return category;
        }

        public void setCategory(String category) {
            this.category = category;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public Boolean getStatus() {
            return status;
        }

        public void setStatus(Boolean status) {
            this.status = status;
        }

        public byte[] getImage() {
            return image;
        }

        public void setImage(byte[] image) {
            this.image = image;
        }
    }

}
