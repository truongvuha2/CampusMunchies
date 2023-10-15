/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author khang
 */
public class Employee {
    private String emp_phone;
    private String emp_name;
    private String emp_password;
    private String emp_address;
    private String emp_birthday;
    private String emp_create;

    public Employee() {
    }

    public Employee(String emp_phone, String emp_name, String emp_password, String emp_address, String emp_birthday, String emp_create) {
        this.emp_phone = emp_phone;
        this.emp_name = emp_name;
        this.emp_password = emp_password;
        this.emp_address = emp_address;
        this.emp_birthday = emp_birthday;
        this.emp_create = emp_create;
    }
    
    public Employee(String emp_phone, String emp_name, String emp_password, String emp_address, String emp_birthday) {
        this.emp_phone = emp_phone;
        this.emp_name = emp_name;
        this.emp_password = emp_password;
        this.emp_address = emp_address;
        this.emp_birthday = emp_birthday;
        }

    public String getEmp_phone() {
        return emp_phone;
    }

    public void setEmp_phone(String emp_phone) {
        this.emp_phone = emp_phone;
    }

    
    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getEmp_password() {
        return emp_password;
    }

    public void setEmp_password(String emp_password) {
        this.emp_password = emp_password;
    }

    public String getEmp_address() {
        return emp_address;
    }

    public void setEmp_address(String emp_address) {
        this.emp_address = emp_address;
    }

    public String getEmp_birthday() {
        return emp_birthday;
    }

    public void setEmp_birthday(String emp_birthday) {
        this.emp_birthday = emp_birthday;
    }

    public String getEmp_create() {
        return emp_create;
    }

    public void setEmp_create(String emp_create) {
        this.emp_create = emp_create;
    }

    @Override
    public String toString() {
        return getEmp_phone()+" "+getEmp_name() + " "+ getEmp_password();
    }
    
    
}
