/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtil;

/**
 *
 * @author htduy
 */
public class ItemDAO {

    public ArrayList<Item> getAllItems() {
        ArrayList<Item> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT [id], [name], [price], [status], [description], [category], [calories], [image], [recipe]\n"
                        + "FROM [DBFOODWEB].[dbo].[Dishes]";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int itemid = table.getInt("id");
                        String itemname = table.getString("name");
                        int price = table.getInt("price");
                        boolean status = table.getBoolean("status");
                        String desc = table.getString("description");
                        String category = table.getString("category");
                        String image = table.getString("image");
                        String recipe = table.getString("recipe");
                        Item it = new Item(itemid, itemname, price, status, desc, category, category, image, recipe);
                        list.add(it);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public ArrayList<Item> getItemsByName(String findName) {
        ArrayList<Item> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT [id], [name], [price], [status], [description], [category], [calories], [image], [recipe]\n"
                        + "FROM [DBFOODWEB].[dbo].[Dishes]\n"
                        + "WHERE [name] LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + findName + "%");
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int itemid = table.getInt("id");
                        String itemname = table.getString("name");
                        int price = table.getInt("price");
                        boolean status = table.getBoolean("status");
                        String desc = table.getString("description");
                        String category = table.getString("category");
                        String image = table.getString("image");
                        String recipe = table.getString("recipe");
                        Item it = new Item(itemid, itemname, price, status, desc, category, category, image, recipe);
                        list.add(it);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public Item getItemById(int itemid) {
        Item rs = null;
        Connection cn = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT [id], [name], [price], [status], [description], [category], [calories], [image], [recipe]\n"
                        + "FROM [DBFOODWEB].[dbo].[Dishes]\n"
                        + "WHERE [id] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, itemid);
                ResultSet table = pst.executeQuery();

                if (table != null) {
                    while (table.next()) {
                        String itemname = table.getString("name");
                        int price = table.getInt("price");
                        boolean status = table.getBoolean("status");
                        String desc = table.getString("description");
                        String category = table.getString("category");
                        String image = table.getString("image");
                        String recipe = table.getString("recipe");
                        rs = new Item(itemid, itemname, price, status, desc, category, category, image, recipe);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }

}
