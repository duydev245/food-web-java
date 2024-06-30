/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Dishes;
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
public class DishesDAO implements GenericDAO<Dishes> {

    @Override
    public void insert(Dishes dish) throws SQLException {
        String sql = "INSERT INTO Dishes (name, price, status, description, image) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dish.getName());
            pstmt.setBigDecimal(2, dish.getPrice());
            pstmt.setBoolean(3, dish.isStatus());
            pstmt.setString(4, dish.getDescription());
            pstmt.setBytes(5, dish.getImage());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DishesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Dishes getById(int id) throws SQLException {
        String sql = "SELECT * FROM Dishes WHERE id = ?";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Dishes(
                        rs.getShort("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getBoolean("status"),
                        rs.getString("description"),
                        rs.getBytes("image")
                );
            }
        } catch (Exception ex) {
            Logger.getLogger(DishesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Dishes> getAll() throws SQLException {
        String sql = "SELECT * FROM Dishes";
        List<Dishes> dishes = new ArrayList<>();
        try (Connection conn = DBUtil.makeConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                dishes.add(new Dishes(
                        rs.getShort("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getBoolean("status"),
                        rs.getString("description"),
                        rs.getBytes("image")
                ));
            }
        } catch (Exception ex) {
            Logger.getLogger(DishesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dishes;
    }

    @Override
    public void update(Dishes dish) throws SQLException {
        String sql = "UPDATE Dishes SET name = ?, price = ?, status = ?, description = ?, image = ? WHERE id = ?";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dish.getName());
            pstmt.setBigDecimal(2, dish.getPrice());
            pstmt.setBoolean(3, dish.isStatus());
            pstmt.setString(4, dish.getDescription());
            pstmt.setBytes(5, dish.getImage());
            pstmt.setInt(6, dish.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DishesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM Dishes WHERE id = ?";
        try (Connection conn = DBUtil.makeConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DishesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
