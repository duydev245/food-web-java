/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Menu;
import java.sql.*;
import java.util.ArrayList;


import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mylib.DBUtil;
/**
 *
 * @author Tan Phat
 */

public class MenuDAO implements GenericDAO<Menu> {

    @Override
    public void insert(Menu menu) throws SQLException {
        String sql = "INSERT INTO Menu (name, period, day_of_week, description, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, menu.getName());
            pstmt.setInt(2, menu.getPeriod());
            pstmt.setInt(3, menu.getDayOfWeek());
            pstmt.setString(4, menu.getDescription());
            pstmt.setBoolean(5, menu.isStatus());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Menu getById(int id) throws SQLException {
        String sql = "SELECT * FROM Menu WHERE id = ?";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Menu(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getByte("period"),
                        rs.getByte("day_of_week"),
                        rs.getString("description"),
                        rs.getBoolean("status")
                );
            }
        } catch (Exception ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Menu> getAll() throws SQLException {
        String sql = "SELECT * FROM Menu";
        List<Menu> menus = new ArrayList<>();
        try (Connection conn = DBUtil.makeConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                menus.add(new Menu(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getByte("period"),
                        rs.getByte("day_of_week"),
                        rs.getString("description"),
                        rs.getBoolean("status")
                ));
            }
        } catch (Exception ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return menus;
    }

    @Override
    public void update(Menu menu) throws SQLException {
        String sql = "UPDATE Menu SET name = ?, period = ?, day_of_week = ?, description = ?, status = ? WHERE id = ?";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, menu.getName());
            pstmt.setByte(2, menu.getPeriod());
            pstmt.setByte(3, menu.getDayOfWeek());
            pstmt.setString(4, menu.getDescription());
            pstmt.setBoolean(5, menu.isStatus());
            pstmt.setInt(6, menu.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM Menu WHERE id = ?";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
