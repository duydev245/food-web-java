/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtil;

/**
 *
 * @author Tan Phat
 */
public class OrderDAO {

    public ArrayList<Order> getAllOrders() {
        ArrayList<Order> orderList = new ArrayList<>();
        Connection conn = null;
        try {
            conn = DBUtil.makeConnection();
            if (conn != null) {
                String sql = "SELECT o.id AS orderId, a.full_name AS accountName, o.order_date AS orderDate, "
                        + "o.ship_date AS shipDate, o.ship_address AS shipAddress, c.name AS shipCity, "
                        + "d.name AS shipDistrict, w.name AS shipWard, o.total_price AS totalPrice, "
                        + "o.customer_notes AS customerNote, o.status AS status "
                        + "FROM Orders o "
                        + "JOIN Accounts a ON o.account_id = a.id "
                        + "JOIN City c ON o.ship_city_id = c.id "
                        + "JOIN District d ON o.ship_district_id = d.id "
                        + "JOIN Ward w ON o.ship_ward_id = w.id";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    String accountName = rs.getString("accountName");
                    Date orderDate = rs.getDate("orderDate");
                    Date shipDate = rs.getDate("shipDate");
                    String shipAddress = rs.getString("shipAddress");
                    String shipCity = rs.getString("shipCity");
                    String shipDistrict = rs.getString("shipDistrict");
                    String shipWard = rs.getString("shipWard");
                    double totalPrice = rs.getDouble("totalPrice");
                    String customerNote = rs.getString("customerNote");
                    boolean status = rs.getBoolean("status");

                    // Create Order object from the retrieved data
                    Order order = new Order(orderId, accountName, orderDate, shipDate, shipAddress, shipCity, shipDistrict, shipWard, totalPrice, customerNote, status);
                    orderList.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return orderList;
    }
}
