/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    /**
     * Get all customers
     *
     * @return a list
     */
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        String sql = "select *from Customer";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String phone = rs.getString(1);
                String name = rs.getString(2);
                String password = rs.getString(3);
                String address = rs.getString(4);
                Date birthday = rs.getDate(5);
                Date create_date = rs.getDate(6);
                int cus_cancel_count = rs.getInt(7);
                customers.add(new Customer(phone, name, address, birthday, create_date, cus_cancel_count));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    public void updateCustomer(String phone, String name, String address, Date birthday, int cancel) {
        try {
            String sql = "update Customer set  cus_name=?,  cus_address=?, cus_birthday=?, cus_cancel_count=? where cus_phone=?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, name);

            ps.setString(2, address);
            ps.setDate(3, birthday);
            ps.setInt(4, cancel);
             ps.setString(5, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        c.updateCustomer("0123456780", "TranTien2",  "NinhKieu_CanTho", Date.valueOf("2003-11-24"), 0);
    }

}
