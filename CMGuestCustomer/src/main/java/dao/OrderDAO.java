/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Food;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author khang
 */
public class OrderDAO extends DBContext {

    private String id = "";

    public void add(Order order, List<Cart> carts) {
        addOrder(order);
        addOrderDetails(order.getId(), carts);
    }

    public List<Order> getAll() {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "select * from [Order] order by ord_date desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new Order(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orders;
    }

    public List<OrderDetail> getOrder(String id) {
        List<OrderDetail> orderDetail = new ArrayList<>();
        FoodDAO f = new FoodDAO();
        try {
            String sql = "select ord_id, f.foo_name, quantity, price from OrderDetail o join Food f on o.foo_id= f.foo_id where ord_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail.add(new OrderDetail(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderDetail;
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
        List<OrderDetail> orders = o.getOrder("ORD0000001");
        for (OrderDetail order : orders) {
            System.out.println(order.toString());
        }
    }

}
