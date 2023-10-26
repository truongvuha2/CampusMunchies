/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Order;

/**
 *
 * @author khang
 */
public class OrderDAO extends DBContext {

    private String id="";

    public void add(Order order, List<Cart> carts) {
        addOrder(order);
        addOrderDetails(order.getId(), carts);
    }

    private void addOrderDetails(String orderId, List<Cart> carts) {
        String sql = "";
        PreparedStatement ps;
        try {
            for (Cart cart : carts) {
                sql = "insert into orderdetail values (?,?,?,?)";
                ps = connection.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, cart.getFood().getId());
                ps.setInt(3, cart.getQuantity());
                ps.setDouble(4, cart.getFood().getRealPrice() * cart.getQuantity());
                ps.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void addOrder(Order order) {
        try {
            id = getID();
            String sql = "insert into [Order] values (?,?,'0',getdate(),?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, order.getCus_phone());
            ps.setString(3, order.getType());
            ps.setString(4, "Waiting");
            ps.setString(5, order.getPay());
            ps.setString(6, order.getNote());
            ps.setDouble(7, order.getTotal());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private String getID() {
        String id = "";
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(ord_id, 4, LEN(ord_id)) AS INT))\n"
                    + "FROM [order] ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int a = rs.getInt(1);
            a++;
            String prefix = "ORD";

            id = prefix + String.format("%07d", a);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return id;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
//        o.add("0123456788", "Spicy", null, "At shop", "COD", 50);
    }

}
