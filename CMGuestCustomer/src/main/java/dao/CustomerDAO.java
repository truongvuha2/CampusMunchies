/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Customer;

/**
 *
 * @author khang
 */
public class CustomerDAO extends DBContext {
    
    public boolean isPhoneExisted(String phone){
         try {
            String sql = "select * from Customer "
                    + "where cus_phone = '" + phone+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean isExisted(String phone, String password) {
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

    public void add(Customer customer, String password) {
        try {
            String sql = "INSERT INTO Customer VALUES\n"
                    + "(?, ?, CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2), ?, ?, GETDATE(), 'Available')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getPhone());
            ps.setString(2, customer.getName());
            ps.setString(3, password);
            ps.setString(4, customer.getAddress());
            ps.setDate(5, customer.getBirthday());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Customer customer) {
        try {
            String sql = "update Customer set  cus_name='"+customer.getName()+"',  cus_address='"+customer.getAddress()+
                    "', cus_birthday='"+customer.getBirthday()+"'  where cus_phone='"+customer.getPhone()+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
           
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void remove(String phone) {
        try {
            String sql = "delete Customer where cus_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List getAll() {
        List<Customer> customers = new ArrayList<>();
        String sql = "select * from Customer";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String phone = rs.getString(1);
                String name = rs.getString(2);
                String address = rs.getString(4);
                Date birthday = rs.getDate(5);
                Date create_date = rs.getDate(6);
                String status = rs.getString(7);
                customers.add(new Customer(phone, name, address, birthday, create_date, status));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    public List<Customer> searchByName(String name) {
        List<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * from Customer"
                    + " where cus_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customers.add(new Customer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getString(7)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    public Customer searchByPhone(String phone) {
        try {
            String sql = "SELECT * "
                    + "FROM Customer where cus_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getString(7)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changePassword(String phone, String password) {
        String sql = "update Customer set "
                + "cus_password=convert(varchar(20),hashbytes('MD5','" + password + "'),2) where cus_phone='" + phone + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
////        List<Customer> list = c.getAll();
////        for (int i = 0; i < list.size(); i++) {
////            System.out.println(list.get(i).toString());
////        }
//        //System.out.println(c.searchByPhone("0123456788"));
//        Customer cus = new Customer("0123456788", "Tien", "aaa",Date.valueOf("1900-02-03"));
//        c.update(cus);
//        System.out.println(c.searchByPhone("0123456788"));
System.out.println(c.isPhoneExisted("0123456700"));
        //System.out.println(c.isExisted("0123456788", "123456789"));
    }
}
