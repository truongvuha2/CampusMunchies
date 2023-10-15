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
    private Date crate_date;
    private int cancel_count;
    
    public Customer() {
    }

    public Customer(String phone, String name, String address, Date birthday, Date crate_date, int cancel_count) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.birthday = birthday;
        this.crate_date = crate_date;
        this.cancel_count = cancel_count;
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

    public Date getCrate_date() {
        return crate_date;
    }

    public void setCrate_date(Date crate_date) {
        this.crate_date = crate_date;
    }

    public int getCancel_count() {
        return cancel_count;
    }

    public void setCancel_count(int cancel_count) {
        this.cancel_count = cancel_count;
    }
    
   

}
