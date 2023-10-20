/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        c.add("0123456788", "FOOD003",3);
    }
}
