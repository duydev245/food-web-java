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
public class Customer_Plan {
    private int id;
    private int accountId;
    private int menuId;

    public Customer_Plan() {
    }

    public Customer_Plan(int id, int accountId, int menuId) {
        this.id = id;
        this.accountId = accountId;
        this.menuId = menuId;
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

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }
    
}
