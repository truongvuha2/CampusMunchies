/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author khang
 */
public class Food {
     private String id;
     private String categoryId;
     private String name;
     private double price;
     private double sale;
     private String description;
     private String status;
     private String img;

    public Food() {
    }

    public Food(String id, String categoryId, String name, double price, double sale, String description, String status, String img) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.status = status;
        this.img = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Food{" + "id=" + id + ", categoryId=" + categoryId + ", name=" + name + ", price=" + price + ", sale=" + sale + ", description=" + description + ", status=" + status + ", img=" + img + '}';
    }
     
     
     
}
