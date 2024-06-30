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
public class Menu_Dishes {
    private int menuId;
    private short dishId;

    public Menu_Dishes() {
    }

    public Menu_Dishes(int menuId, short dishId) {
        this.menuId = menuId;
        this.dishId = dishId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public short getDishId() {
        return dishId;
    }

    public void setDishId(short dishId) {
        this.dishId = dishId;
    }
    
}
