/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
<<<<<<< HEAD
 * @author Khanh
=======
 * @author khang
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
 */
public class Employee {

    private String phone;
    private String name;
    private String address;
    private String password;
    private Date birthday;
    private Date create;
<<<<<<< HEAD
    private int order_served;
    private String emp_status;

    public Employee(String name, String phone, String password, String address, Date birthday, Date create) {
=======

    public Employee(String phone, String name, String password, String address, Date birthday, Date create) {
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
        this.phone = phone;
        this.name = name;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.create = create;
    }

<<<<<<< HEAD
    public Employee(String name, String phone, String address, Date birthday, int order_served, Date create, String emp_status) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.birthday = birthday;
        this.create = create;
        this.order_served = order_served;
        this.emp_status = emp_status;
    }

    public Employee(String name, String phone, int order_served) {
        this.phone = phone;
        this.name = name;
        this.order_served = order_served;
    }

    public String getEmp_status() {
        return emp_status;
    }

    public void setEmp_status(String emp_status) {
        this.emp_status = emp_status;
    }

=======
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

<<<<<<< HEAD
    public int getOrder_served() {
        return order_served;
    }

    public void setOrder_served(int order_served) {
        this.order_served = order_served;
    }
    
=======
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
    @Override
    public String toString() {
        return "Employee{" + "phone=" + phone + ", name=" + name + ", address=" + address + ", birthday=" + birthday + ", create=" + create + '}';
    }
}
