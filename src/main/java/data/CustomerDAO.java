/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Customer;

/**
 *
 * @author khang
 */
public class CustomerDAO extends DBContext {

    /**
     * To check the customer's phone number and password if it exists or not
     *
     * @param phone
     * @param password
     * @return true if the account is found, false if the account is not found
     */
    public boolean isCustomerExisted(String phone, String password) {
        try {
            String sql = "select * from Customer "
                    + "where cus_phone = '" + phone + "' and cus_password = CONVERT(VARCHAR(20), HASHBYTES('MD5', '" + password + "'), 2)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * Add new customer
     *
     * @param phone
     * @param name
     * @param password
     * @param address
     * @param birthday
     * @param cancel
     */
    public void addCustomer(String phone, String name, String password, String address, Date birthday, int cancel) {
        try {
            String sql = "INSERT INTO Customer VALUES\n"
                    + "(?, ?, CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2), ?, ?, GETDATE(), ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, name);
            ps.setString(3, password);
            ps.setString(4, address);
            ps.setDate(5, birthday);
            ps.setInt(6, cancel);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        c.addCustomer("0101010101", "Khang", "123", "FPT", Date.valueOf("2003-01-23"), 0);
    }
    
}

