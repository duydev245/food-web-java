/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
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
public class AccountDAO {

    // insert role = 'User'
    public int insert(String fullName, String password, String email, String phone, String address, int wardId, int districtId, int cityId) throws Exception {
        int result = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Accounts (full_name, [password], email, phone, [address], ward_id, district_id, city_id, [role], [status]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'user', 1)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, fullName);
                pstmt.setString(2, password);
                pstmt.setString(3, email);
                pstmt.setString(4, phone);
                pstmt.setString(5, address);
                pstmt.setInt(6, wardId);
                pstmt.setInt(7, districtId);
                pstmt.setInt(8, cityId);
                result = pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // Re-throw the exception after logging it
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public boolean checkEmail(String email) {
        boolean exists = false;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            // Make connection between backend and SQL Server
            cn = DBUtil.makeConnection();
            if (cn != null) {
                // Write SQL and execute SQL
                String sql = "SELECT [email] FROM [dbo].[Accounts] \n"
                        + "WHERE [email] = ? COLLATE SQL_Latin1_General_CP1_CI_AS";
                pst = cn.prepareStatement(sql);
                // Set email input parameter
                pst.setString(1, email);
                // Execute SQL
                rs = pst.executeQuery();
                // Check if any result exists
                if (rs != null && rs.next()) {
                    exists = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return exists;
    }

    public Account checkLogin(String email, String password) {
        Account rs = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet table = null;

        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "SELECT [id],[full_name],[password],[email],[phone],[address],[ward_id],[district_id],[city_id],[role],[status] \n"
                        + "  FROM [dbo].[Accounts] \n"
                        + "  WHERE [email] = ? AND [Password] = ? COLLATE SQL_Latin1_General_CP1_CI_AS ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                table = pst.executeQuery();

                if (table != null && table.next()) {
                    String fullName = table.getString("full_name");
                    String dbPassword = table.getString("password");
                    String dbEmail = table.getString("email");
                    String phone = table.getString("phone");
                    String address = table.getString("address");
                    int wardId = table.getInt("ward_id");
                    int districtId = table.getInt("district_id");
                    int cityId = table.getInt("city_id");
                    String role = table.getString("role");
                    boolean status = table.getBoolean("status");

                    rs = new Account(fullName, dbPassword, dbEmail, phone, address, wardId, districtId, cityId, role, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (table != null) {
                    table.close();
                }
                if (pst != null) {
                    pst.close();
                }
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
