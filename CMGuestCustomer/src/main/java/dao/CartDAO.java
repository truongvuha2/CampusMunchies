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
import model.Cart;
import model.Food;

/**
 *
 * @author khang
 */
public class CartDAO extends DBContext {

    public void add(String phone, String foodId) {
        try {
            int quantity = getQuantity(phone, foodId);
            if (quantity == 0) {
                String sql = "insert into cart values(?,?,?) ";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, phone);
                ps.setString(2, foodId);
                ps.setInt(3, 1);
                ps.executeUpdate();
            } else {
                String sql = "update cart set quantity = ? where cus_phone=? and foo_id=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(2, phone);
                ps.setString(3, foodId);
                ps.setInt(1, quantity + 1);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private int getQuantity(String phone, String foodId) throws SQLException {

        String sql = "select * from cart where cus_phone=? and foo_id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, phone);
        ps.setString(2, foodId);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? rs.getInt(3) : 0;

    }

    public void add(String phone, String foodId, int quantity) {
        try {
            int quantity2 = getQuantity(phone, foodId);
            if (quantity2 == 0) {
                String sql = "insert into cart values(?,?,?) ";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, phone);
                ps.setString(2, foodId);
                ps.setInt(3, quantity);
                ps.executeUpdate();
            } else {
                String sql = "update cart set quantity = ? where cus_phone=? and foo_id=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(2, phone);
                ps.setString(3, foodId);
                ps.setInt(1, quantity2 + quantity);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Cart> searchByPhone(String phone) {
        List<Cart> carts = new ArrayList<>();
        try {
            String sql = "select * from cart where cus_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FoodDAO f = new FoodDAO();
                Food food = f.searchByID(rs.getString(2));
                carts.add(new Cart(rs.getString(1), food, rs.getInt(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return carts;
    }

    public static void main(String[] args) {
        CartDAO c = new CartDAO();

//        List<Cart> carts = c.searchByPhone("0123456788");
//        for (int i = 0; i < carts.size(); i++) {
//            System.out.println(carts.get(i).toString());
//        }
        c.updateQuantity(10, "0123456788", "FOOD001");
    }

    public void updateQuantity(int quantity, String phone, String foodID) {
        try {
            String sql = "update cart set quantity = ? where cus_phone = ? and foo_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setString(2, phone);
            ps.setString(3, foodID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCart(String phone, String foodID) {
        try {
            String sql = "delete from cart where cus_phone = ? and foo_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, foodID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
     public void deleteAll(String phone) {
        try {
            String sql = "delete from cart where cus_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
