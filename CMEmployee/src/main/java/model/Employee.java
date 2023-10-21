/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author khang
 */
public class Employee {

    private String phone;
    private String name;
    private String address;
    private Date birthday;
    private Date create;

    public Employee(String phone, String name, String address, Date birthday, Date create) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.birthday = birthday;
        this.create = create;
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

    @Override
    public String toString() {
        return "Employee{" + "phone=" + phone + ", name=" + name + ", address=" + address + ", birthday=" + birthday + ", create=" + create + '}';
    }
}
