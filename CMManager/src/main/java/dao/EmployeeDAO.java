/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Employee;

/**
 *
 * @author khang
 */
public class EmployeeDAO extends DBContext implements ICRUD<Employee> {

    @Override
    public boolean isExisted(String phone, String password) {
        try {
            String sql = "select * from employee "
                    + "where emp_phone = '" + phone + "' and emp_password = CONVERT(VARCHAR(20), HASHBYTES('MD5', '" + password + "'), 2)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public void add(Employee employee, String password) {
        try {
            String sql = "insert into [Employee] values"
                    + "(?,?,CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2),"
                    + "?,?,getdate())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getPhone());
            ps.setString(2, employee.getName());
            ps.setString(3, password);
            ps.setString(4, employee.getAddress());
            ps.setDate(5, employee.getBirthday());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Employee employee) {
        try {
            String sql = "update employee set  emp_name=?,  emp_address=?, emp_birthday=? where emp_phone=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getAddress());
            ps.setDate(3, employee.getBirthday());
            ps.setString(4, employee.getPhone());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void remove(String phone) {
        try {
            String sql = "delete Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public List getAll() {
        List<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List searchByName(String name) {
        List<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee  where emp_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public Employee searchByPhone(String phone) {
        try {
            String sql = "select * from Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void changePassword(String phone, String password) {
        String sql = "update employee set emp_password=convert(varchar(20),hashbytes('MD5',?),2) where emp_phone=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {

    }
}
