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
import model.Employee;

/**
 *
 * @author khang
 */
public class EmployeeDAO extends DBContext {

    /**
     * Get all employees
     * @return list employees
     */
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getString(1),
                        rs.getString(2),
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

    /**
     * get employee by phone
     * @param phone
     * @return employee
     */
    public Employee getEmployeebyPhone(String phone) {

        try {
            String sql = "select * from Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1),
                        rs.getString(2),
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

    /**
     * get employee by name
     * @param name
     * @return list employee
     */
    public List<Employee> getEmployeebyName(String name) {
        List<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee  where emp_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getString(1),
                        rs.getString(2),
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

    /**
     * delete an employee
     * @param phone 
     */
    public void deleteEmployee(String phone) {
        try {
            String sql = "delete Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * add employee
     * @param phone
     * @param name
     * @param password
     * @param address
     * @param birthday 
     */
    public void addEmployee(String phone, String name, String password, String address, Date birthday) {
        try {
            String sql = "insert into [Employee] values"
                    + "(?,?,CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2),"
                    + "?,?,getdate())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, name);
            ps.setString(3, password);
            ps.setString(4, address);
            ps.setDate(5, birthday);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        EmployeeDAO employeeDAO = new EmployeeDAO();

    }
}
