/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Tan Phat
 */
public class Dish_Ingredients {
    private short dishId;
    private short ingredientId;
    private short ingredientQuantity;
    private String unit;

    public Dish_Ingredients() {
    }

    public Dish_Ingredients(short dishId, short ingredientId, short ingredientQuantity, String unit) {
        this.dishId = dishId;
        this.ingredientId = ingredientId;
        this.ingredientQuantity = ingredientQuantity;
        this.unit = unit;
    }

    public short getDishId() {
        return dishId;
    }

    public void setDishId(short dishId) {
        this.dishId = dishId;
    }

    public short getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(short ingredientId) {
        this.ingredientId = ingredientId;
    }

    public short getIngredientQuantity() {
        return ingredientQuantity;
    }

    public void setIngredientQuantity(short ingredientQuantity) {
        this.ingredientQuantity = ingredientQuantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
    
}
