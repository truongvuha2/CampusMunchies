/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author khang
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
        List<Category> cate = new ArrayList<>();
        try {
            String sql = "select * from category";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Category(rs.getString(1), rs.getString(2), rs.getString(3)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return cate;
    
    }
    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<Category>  lists = c.getAll();
        for(Category ca:lists){
            System.out.println(ca.toString());
        }
    }
}
