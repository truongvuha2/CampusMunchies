/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

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

    //Get all employees in Employee table 
    public List<Employee> getAllEmployees() {
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
                        rs.getString(5),
                        rs.getString(6)
                ));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Employee getEmployeebyPhone(String phone) {

        try {
            String sql = "select * from Employee  where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Employee getEmployeebyName(String name) {

        try {
            String sql = "select * from Employee  where emp_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void deleteEmployee(String phone){
        try {
            String sql = "delete Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
           
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    

    public static void main(String[] args) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
//
//        // Gọi phương thức getAllEmployees để lấy danh sách nhân viên
        List<Employee> employees = employeeDAO.getAllEmployees();
        System.out.println(employeeDAO.getEmployeebyPhone("0123456785"));
        System.out.println(employeeDAO.getEmployeebyName("vid"));
        employeeDAO.deleteEmployee("0123456785");
        }
    }

