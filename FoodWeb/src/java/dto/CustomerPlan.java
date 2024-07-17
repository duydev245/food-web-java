/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author htduy
 */
public class CustomerPlan {

    private int id;
    private int accid;
    private Item item;

    public CustomerPlan() {
    }

    public CustomerPlan(int id, int accid, Item item) {
        this.id = id;
        this.accid = accid;
        this.item = item;
    }

    public CustomerPlan(int accid, Item item) {
        this.accid = accid;
        this.item = item;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccid() {
        return accid;
    }

    public void setAccid(int accid) {
        this.accid = accid;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

}
