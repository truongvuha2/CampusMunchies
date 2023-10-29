/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import java.util.ArrayList;
import java.util.List;
import model.Customer;

/**
 *
 * @author khang
 */
public class CustomerDAO extends DBContext implements ICRUD<Customer> {

    @Override
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

    @Override
    public void add(Customer customer, String password) {
        try {
            String sql = "INSERT INTO Customer VALUES\n"
                    + "(?, ?, CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2), ?, ?, GETDATE(), ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getPhone());
            ps.setString(2, customer.getName());
            ps.setString(3, password);
            ps.setString(4, customer.getAddress());
            ps.setDate(5, customer.getBirthday());
            ps.setInt(6, customer.getCancel_count());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Customer customer) {
        try {
            String sql = "update Customer set  cus_name=?,  cus_address=?, cus_birthday=?, cus_cancel_count=? where cus_phone=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setDate(3, customer.getBirthday());
            ps.setInt(4, customer.getCancel_count());
            ps.setString(5, customer.getPhone());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
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

    @Override
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
                int cus_cancel_count = rs.getInt(7);
                customers.add(new Customer(phone, name, address, birthday, create_date, cus_cancel_count));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    @Override
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
                        rs.getString(3),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getInt(7)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    @Override
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
                        rs.getInt(7)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void changePassword(String phone, String password) {
        String sql = "update Customer set cus_password=convert(varchar(20),hashbytes('MD5',?),2) where cus_phone=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


    public List<Customer> getCusListManagement() {
        List<Customer> listCus = new ArrayList<>();
        String sql = "with r as(\n"
                + "SELECT C.cus_phone, COALESCE(COUNT(O.ord_id), 0) AS order_count,COALESCE(sum(O.ord_total),0)[total]\n"
                + "FROM Customer C\n"
                + "LEFT JOIN [Order] O ON C.cus_phone = O.cus_phone\n"
                + "GROUP BY C.cus_phone\n"
                + ")\n"
                + "select c.cus_name, r.* from r join Customer c on r.cus_phone=c.cus_phone\n"
                + "where c.cus_status !='Deleted'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                int numOrders = Integer.parseInt(rs.getString(3));
                double totalSpend = rs.getDouble(4);
                listCus.add(new Customer(name, phone, numOrders, totalSpend));
            }
            return listCus;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer> getHonorListManagement() {
        List<Customer> listCus = new ArrayList<>();
        String sql = "WITH r AS (\n"
                + "SELECT o.cus_phone, COUNT(o.cus_phone) AS [count], SUM(o.ord_total) AS [total]\n"
                + "FROM Customer c\n"
                + "JOIN [Order] o ON c.cus_phone = o.cus_phone\n"
                + "GROUP BY o.cus_phone\n"
                + ")\n"
                + "SELECT TOP 5 c.cus_name, r.cus_phone, [count], [total]\n"
                + "FROM r\n"
                + "JOIN Customer c ON r.cus_phone = c.cus_phone\n"
                + "where c.cus_status !='Deleted'\n"
                + "ORDER BY [total] DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                int numOrders = Integer.parseInt(rs.getString(3));
                double totalSpend = Double.parseDouble(rs.getString(4));
                listCus.add(new Customer(name, phone, numOrders, totalSpend));
            }
            return listCus;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer> getBlackListManagement() {
        List<Customer> listCus = new ArrayList<>();
        String sql = "WITH OrderSummary AS (\n"
                + "    SELECT\n"
                + "        c.cus_name,\n"
                + "        c.cus_phone,\n"
                + "        c.cus_status,\n"
                + "        SUM(CASE WHEN o.ord_status = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledOrderCount,\n"
                + "        COUNT(DISTINCT o.ord_id) AS TotalOrderCount\n"
                + "    FROM Customer c\n"
                + "    LEFT JOIN [Order] o ON c.cus_phone = o.cus_phone\n"
                + "    GROUP BY c.cus_phone, c.cus_name, c.cus_status\n"
                + ")\n"
                + "SELECT\n"
                + "    cus_name,\n"
                + "    cus_phone,\n"
                + "    TotalOrderCount,\n"
                + "    CancelledOrderCount\n"
                + "FROM OrderSummary\n"
                + "WHERE cus_status = 'Blocked'\n"
                + "ORDER BY CancelledOrderCount DESC;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                int numOrders = Integer.parseInt(rs.getString(3));
                int cancelCount = Integer.parseInt(rs.getString(4));
                listCus.add(new Customer(name, phone, numOrders, cancelCount));
            }
            return listCus;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer getCustomerDetail(String cid) {
        try {
            String sql = "WITH OrderSummary AS (\n"
                    + "SELECT C.cus_phone,\n"
                    + "COALESCE(COUNT(O.ord_id), 0) AS order_count,\n"
                    + "COALESCE(SUM(O.ord_total), 0) AS total,\n"
                    + "COALESCE(SUM(CASE WHEN O.ord_status = 'Cancelled' THEN 1 ELSE 0 END), 0) AS cus_cancel_count\n"
                    + "FROM Customer C\n"
                    + "LEFT JOIN [Order] O ON C.cus_phone = O.cus_phone\n"
                    + "GROUP BY C.cus_phone\n"
                    + ")\n"
                    + "SELECT C.cus_name, C.cus_phone, C.cus_address, C.cus_birthday, C.cus_create, OS.cus_cancel_count, OS.order_count, OS.total, C.cus_status\n"
                    + "FROM Customer C\n"
                    + "JOIN OrderSummary OS ON C.cus_phone = OS.cus_phone\n"
                    + "where c.cus_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String name = rs.getString(1);
            String address = rs.getString(2);
            String phone = rs.getString(3);
            Date birthday = rs.getDate(4);//
            Date create_date = rs.getDate(5);
            int cancel_count = rs.getInt(6);
            int numberOrder = rs.getInt(7);
            double totalSpending = rs.getDouble(8);
            String cus_status = rs.getString(9);
            return new Customer(name, phone, address, birthday, create_date, cancel_count, numberOrder, totalSpending, cus_status);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteCustomer(String phone) {
        try {
            String sql = "update Customer set cus_status= 'Deleted' where cus_phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void blockCustomer(String phone) {
        try {
            String sql = "update Customer set cus_status= 'Blocked' where cus_phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void unblockCustomer(String phone) {
        try {
            String sql = "update Customer set cus_status= 'Available' where cus_phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalUser() {
        try {
            String sql = "select COUNT(*) from Customer\n"
                    + "where cus_status <> 'Deleted'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Customer> getListNewUser() {
        List<Customer> listNew = new ArrayList<>();
        try {
            String sql = "select top (4) cus_name, cus_create, cus_phone from Customer\n"
                    + "where cus_status <> 'Deleted'\n"
                    + "order by(cus_create) desc ";
            String time_ago;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                Date create_date = rs.getDate(2);
                String phone = rs.getString(3);
                LocalDate localDateCreate = create_date.toLocalDate();
                time_ago = getTimeAgo(localDateCreate);
                listNew.add(new Customer(name, time_ago, phone));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listNew;
    }

    public String getTimeAgo(LocalDate dateCreate) {
        LocalDate currentDate = LocalDate.now();
        long timeAgo = ChronoUnit.DAYS.between(dateCreate, currentDate);
        return timeAgo == 0 ? "Today": timeAgo + " Days Ago";
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        List<Customer> list = c.getAll();
        System.out.println(c.getCustomerDetail("0123456788").toString());

    
       
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }
        
        System.out.println(c.isExisted("0123456788", "password2"));

    }
}
