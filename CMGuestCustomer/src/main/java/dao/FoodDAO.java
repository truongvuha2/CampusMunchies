/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Food;

/**
 *
 * @author khang
 */
public class FoodDAO extends DBContext {

    /**
     * Test function
     *
     * @param args
     */
    public static void main(String[] args) {
        FoodDAO f = new FoodDAO();
        List<Food> foods = f.searchByName("b");
        for (int i = 0; i < foods.size(); i++) {
            System.out.println(foods.get(i).toString());
        }
    }

    /**
     * check food is existed in food table before
     *
     * @param id
     * @return
     */
    public boolean isExisted(String id) {
        try {
            String sql = "select * from food  "
                    + "where foo_id  = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * add food to food table
     *
     * @param food
     */
    public void add(Food food) {
        try {
            String sql = "insert into Food values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, food.getId());
            ps.setString(2, food.getCategoryId());
            ps.setString(3, food.getName());
            ps.setDouble(4, food.getPrice());
            ps.setDouble(5, food.getSale());
            ps.setString(6, food.getDescription());
            ps.setString(7, food.getStatus());
            ps.setString(8, food.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update food which has before from food table
     *
     * @param food
     */
    public void update(Food food) {
        try {
            String sql = "update Food set cat_id = ?, "
                    + "foo_name = ?, "
                    + "foo_price = ? , "
                    + "foo_sale = ? , "
                    + "foo_desription =?, "
                    + "foo_status = ?, "
                    + "foo_img =? "
                    + "where foo_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(8, food.getId());
            ps.setString(1, food.getCategoryId());
            ps.setString(2, food.getName());
            ps.setDouble(3, food.getPrice());
            ps.setDouble(4, food.getSale());
            ps.setString(5, food.getDescription());
            ps.setString(6, food.getStatus());
            ps.setString(7, food.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update food status by id in food table
     *
     * @param id
     * @param status
     */
    public void updateStatus(String id, String status) {
        try {
            String sql = "update Food set"
                    + "foo_status = ?, "
                    + "where foo_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * get all food from food table
     *
     * @return
     */
    public List<Food> getAll() {
        List<Food> list = new ArrayList<>();
        try {
            String sql = "select * from Food where foo_status<>'Deleted'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search food by name from food table
     *
     * @param name
     * @return
     */
    public List<Food> searchByName(String name) {
        List<Food> list = new ArrayList<>();
        try {
            String sql = "select * from Food  where foo_name LIKE ? and foo_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search by cateID from food table
     *
     * @param cateID
     * @return
     */
    public List<Food> searchByCateID(String cateID) {
        List<Food> list = new ArrayList<>();
        try {
            String sql = "select * from Food  where cat_id = ? and foo_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Food searchByID(String id) {
        try {
            String sql = "select * from Food  where foo_id = ? and foo_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Food> getTopFourSeller() {
        List<Food> foods = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.foo_id, COALESCE(SUM(od.quantity), 0) AS so_lan_dat\n"
                    + "FROM food f\n"
                    + "LEFT JOIN orderdetail od ON f.foo_id = od.foo_id\n"
                    + "where f.foo_status <> 'Deleted'\n"
                    + "GROUP BY f.foo_id\n"
                    + "order by so_lan_dat desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                foods.add(searchByID(rs.getString(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return foods;
    }

    public List<Food> getTopFourLastest() {
        List<Food> foods = new ArrayList<>();
        try {
            String sql = "Select top(4) foo_id from Food\n"
                    + "where foo_status<>'Deleted'\n"
                    + "order by foo_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                foods.add(searchByID(rs.getString(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return foods;
    }
}
