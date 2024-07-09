/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mylib.DBUtil;

/**
 *
 * @author htduy
 */
public class MenuDAO {

    public ArrayList<Menu> getAllMenus() {
        ArrayList<Menu> menus = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT\n"
                        + "    m.id AS menu_id,\n"
                        + "    m.name AS menu_name,\n"
                        + "    m.status AS menu_status,\n"
                        + "    m.description AS menu_description, \n"
                        + "    m.category AS menu_category,\n"
                        + "    d.price AS dish_price,\n"
                        + "    d.calories AS dish_calories,\n"
                        + "    d.image AS dish_image\n"
                        + "FROM \n"
                        + "    Menu m\n"
                        + "JOIN \n"
                        + "    Menu_Dishes md ON m.id = md.menu_id\n"
                        + "JOIN \n"
                        + "    Dishes d ON md.dish_id = d.id;";

                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();

                HashMap<Integer, Menu> menuMap = new HashMap<>();
                while (rs.next()) {
                    int menuId = rs.getInt("menu_id");
                    String menuName = rs.getString("menu_name");
                    boolean menuStatus = rs.getBoolean("menu_status");
                    String menuDescription = rs.getString("menu_description");
                    String menuCategory = rs.getString("menu_category");
                    int dishPrice = rs.getInt("dish_price");
                    int dishCalories = rs.getInt("dish_calories");
                    String dishImage = rs.getString("dish_image");

                    Menu menu;
                    if (menuMap.containsKey(menuId)) {
                        menu = menuMap.get(menuId);
                    } else {
                        menu = new Menu(menuId, menuName, 0, menuStatus, menuDescription, menuCategory, 0, new ArrayList<>());
                        menuMap.put(menuId, menu);
                    }

                    menu.setTotalPrice(menu.getTotalPrice() + dishPrice);
                    menu.setTotalCalories(menu.getTotalCalories() + dishCalories);

                    List<String> images = menu.getImages();
                    if (images.size() < 4) {
                        images.add(dishImage);
                    }
                }

                menus.addAll(menuMap.values());
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
        return menus;
    }

    public Menu getMenuById(int menuId) {
        Menu menu = null;
        Connection cn = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT\n"
                        + "    m.name AS menu_name,\n"
                        + "    d.price AS dish_price,\n"
                        + "    m.status AS menu_status,\n"
                        + "    m.description AS menu_description, \n"
                        + "    m.category AS menu_category,\n"
                        + "    d.calories AS dish_calories,\n"
                        + "    d.image AS dish_image  \n"
                        + "FROM \n"
                        + "    Menu m\n"
                        + "JOIN \n"
                        + "    Menu_Dishes md ON m.id = md.menu_id\n"
                        + "JOIN \n"
                        + "    Dishes d ON md.dish_id = d.id\n"
                        + "WHERE \n"
                        + "    m.id = ?;";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, menuId);
                ResultSet rs = pst.executeQuery();

                String menuName = null;
                String menuDescription = null;
                int totalPrice = 0;
                int totalCalories = 0;
                List<String> dishImages = new ArrayList<>();
                String menuCategory = null;

                while (rs.next()) {
                    menuName = rs.getString("menu_name");
                    menuDescription = rs.getString("menu_description");
                    menuCategory = rs.getString("menu_category");

                    int dishPrice = rs.getInt("dish_price");
                    boolean menuStatus = rs.getBoolean("menu_status");
                    int dishCalories = rs.getInt("dish_calories");
                    String dishImage = rs.getString("dish_image");

                    dishImages.add(dishImage);

                    totalPrice += dishPrice;
                    totalCalories += dishCalories;

                    menu = new Menu(menuId, menuName, totalPrice, menuStatus, menuDescription, menuCategory, totalCalories, dishImages);
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
        return menu;
    }

    public ArrayList<Menu> getMenuByName(String findName) {
        ArrayList<Menu> menus = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT\n"
                        + "    m.id AS menu_id,\n"
                        + "    m.name AS menu_name,\n"
                        + "    m.status AS menu_status,\n"
                        + "    m.description AS menu_description,\n"
                        + "    m.category AS menu_category,\n"
                        + "    d.price AS dish_price,\n"
                        + "    d.calories AS dish_calories,\n"
                        + "    d.image AS dish_image\n"
                        + "FROM\n"
                        + "    Menu m\n"
                        + "JOIN\n"
                        + "    Menu_Dishes md ON m.id = md.menu_id\n"
                        + "JOIN\n"
                        + "    Dishes d ON md.dish_id = d.id\n"
                        + "WHERE\n"
                        + "    m.name LIKE ?;";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + findName + "%");
                ResultSet rs = pst.executeQuery();

                HashMap<Integer, Menu> menuMap = new HashMap<>();
                while (rs.next()) {
                    int menuId = rs.getInt("menu_id");
                    String menuName = rs.getString("menu_name");
                    boolean menuStatus = rs.getBoolean("menu_status");
                    String menuDescription = rs.getString("menu_description");
                    String menuCategory = rs.getString("menu_category");
                    int dishPrice = rs.getInt("dish_price");
                    int dishCalories = rs.getInt("dish_calories");
                    String dishImage = rs.getString("dish_image");

                    Menu menu;
                    if (menuMap.containsKey(menuId)) {
                        menu = menuMap.get(menuId);
                    } else {
                        menu = new Menu(menuId, menuName, 0, menuStatus, menuDescription, menuCategory, 0, new ArrayList<>());
                        menuMap.put(menuId, menu);
                    }

                    menu.setTotalPrice(menu.getTotalPrice() + dishPrice);
                    menu.setTotalCalories(menu.getTotalCalories() + dishCalories);

                    List<String> images = menu.getImages();
                    if (images.size() < 4) {
                        images.add(dishImage);
                    }
                }

                menus.addAll(menuMap.values());
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
        return menus;
    }
    
}
