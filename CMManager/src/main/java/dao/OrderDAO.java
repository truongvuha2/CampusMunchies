/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author MY LAPTOP
 */
public class OrderDAO extends DBContext {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        this.conn = connection;
    }

    public ResultSet getAll() {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone order by o.ord_status desc";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public ResultSet getOrderByPhone(String empoyeePhone) {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where c.cus_phone=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(empoyeePhone));
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
}
