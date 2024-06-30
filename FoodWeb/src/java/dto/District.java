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
public class District {
    private short id;
    private String name;
    private short cityId;

    public District() {
    }

    public District(short id, String name, short cityId) {
        this.id = id;
        this.name = name;
        this.cityId = cityId;
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

    public short getCityId() {
        return cityId;
    }

    public void setCityId(short cityId) {
        this.cityId = cityId;
    }
    
}
