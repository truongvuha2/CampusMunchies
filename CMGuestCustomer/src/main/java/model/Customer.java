/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ddand
 */
public class Customer {
    private String phone;
    private String name;
    private String address;
    private Date birthday;
    private Date create_date;
    private int cancel_count;

    public Customer(String phone, String name, String address, Date birthday, Date create_date, int cancel_count) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.birthday = birthday;
        this.create_date = create_date;
        this.cancel_count = cancel_count;
    }

    public Customer(String phone, String name, String address, Date birthday) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.birthday = birthday;
       
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

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getCancel_count() {
        return cancel_count;
    }

    public void setCancel_count(int cancel_count) {
        this.cancel_count = cancel_count;
    }

    @Override
    public String toString() {
        return "Customer{" + "phone=" + phone + ", name=" + name + ", address=" + address + ", birthday=" + birthday + ", create_date=" + create_date + ", cancel_count=" + cancel_count + '}';
    }
    
     

}
