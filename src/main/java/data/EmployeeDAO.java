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

    //Get employee by name
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

    //Delete employee by phone number
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

    public void addEmployee(Employee employee) {
        try {
            String sql = "insert into [Employee] values"
                    + "(?,?,CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2),"
                    + "?,?,getdate())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getEmp_phone());
            ps.setString(2, employee.getEmp_name());
            ps.setString(3, employee.getEmp_password());
            ps.setString(4, employee.getEmp_address());
            ps.setString(5, employee.getEmp_birthday());
            
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
        //employeeDAO.deleteEmployee("0123456785");
        employeeDAO.addEmployee(new Employee("0123456785", "Tien", "adc", "", "2003-04-03"));
    }
}
