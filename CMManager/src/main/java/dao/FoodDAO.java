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
        // List<Food> foods = f.searchByName("b");
//        for (int i = 0; i < foods.size(); i++) {
//            System.out.println(foods.get(i).toString());
//        }
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
            String sql = "update Food set cat_id = ?, \n"
                    + "foo_name = ?, \n"
                    + "foo_price = ? , \n"
                    + "foo_sale = ? , \n"
                    + "foo_description =?, \n"
                    + "foo_status = ?, \n"
                    + "foo_img =? \n"
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
     * remove food which has before from food table
     *
     * @param id
     */
    public void remove(String id) {
        try {
            String sql = "delete Employee where foo_id  = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
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
            String sql = "select * from Food";
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
            String sql = "select * from Food  where foo_name LIKE ?  ";
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
            String sql = "select * from Food  where cat_id = ?  ";
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

    public Food getFoodDetails(String id) {
        try {
            String sql = "SELECT f.foo_id, f.foo_name, f.foo_price, f.foo_sale, f.foo_description, f.foo_status, f.foo_img, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered, c.cat_name, c.cat_id\n"
                    + "FROM Food f\n"
                    + "LEFT JOIN OrderDetail od ON f.foo_id = od.foo_id\n"
                    + "LEFT JOIN Category c ON f.cat_id = c.cat_id\n"
                    + "where f.foo_id = ?\n"
                    + "GROUP BY f.foo_id, f.foo_name, f.foo_price, f.foo_sale, f.foo_description, f.foo_status, f.foo_img, c.cat_name, c.cat_id";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getIDForNewFood() {
        try {
            String maxID;
            String sql = "select max(foo_id) from Food";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            maxID = rs.getString(1);
            String prefix = maxID.substring(0, 4); // "FOOD"
            String numberPart = maxID.substring(4); // "016"
            int number = Integer.parseInt(numberPart); // 16
            number++; // Tăng giá trị lên một đơn vị
            String newID = prefix + String.format("%03d", number); // "FOOD017"
            return newID;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Food> getListBestSeller() {
        try {
            List<Food> listBestSeller = new ArrayList<>();
            String sql = "SELECT TOP 8 f.foo_id, f.foo_name, f.foo_img, f.foo_price, f.foo_sale, f.foo_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Food f\n"
                    + "LEFT JOIN OrderDetail od ON f.foo_id = od.foo_id\n"
                    + "WHERE f.foo_status != 'Deleted'\n"
                    + "GROUP BY f.foo_id, f.foo_name, f.foo_price, f.foo_sale, f.foo_img, f.foo_status\n"
                    + "ORDER BY total_quantity_ordered DESC;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listBestSeller.add(new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return listBestSeller;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Food> getListMenu() {
        try {
            List<Food> listMenu = new ArrayList<>();
            String sql = "SELECT f.foo_id, f.foo_name, f.foo_img, f.foo_price, f.foo_sale, f.cat_id, f.foo_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Food f\n"
                    + "LEFT JOIN OrderDetail od ON f.foo_id = od.foo_id\n"
                    + "WHERE f.foo_status != 'Deleted'\n"
                    + "GROUP BY f.foo_id, f.foo_name, f.foo_img, f.foo_price, f.foo_sale, f.cat_id, f.foo_status";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listMenu.add(new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            return listMenu;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Food> getListSuggest(String cateId) {
        List<Food> list = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.foo_id, f.foo_name, f.foo_img, f.foo_price, f.foo_sale, f.foo_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Food f\n"
                    + "LEFT JOIN OrderDetail od ON f.foo_id = od.foo_id\n"
                    + "WHERE f.cat_id = ? AND f.foo_status != 'Deleted'\n"
                    + "GROUP BY f.foo_id, f.foo_name, f.foo_price, f.foo_sale, f.foo_img, f.foo_status\n"
                    + "order by(total_quantity_ordered) desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteFood(String foodId) {
        try {
            String sql = "update Food set foo_status = 'Deleted' where foo_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, foodId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Food getFoodUpdate(String id) {
        try {
            String sql = "select a.foo_id, a.foo_name, a.foo_price, a.foo_sale, a.foo_description, a.foo_status, a.foo_img, b.cat_name, b.cat_id from Food a\n"
                    + "join Category b on a.cat_id=b.cat_id\n"
                    + "where foo_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Food(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateFood(Food food) {
        try {
            String sql = "UPDATE Food\n"
                    + "SET cat_id = ?, \n"
                    + "    foo_name = ?, \n"
                    + "    foo_price = ?, \n"
                    + "    foo_sale = ?,  \n"
                    + "    foo_description = ?,\n"
                    + "    foo_status = ?,\n"
                    + "    foo_img = ? \n"
                    + "WHERE foo_id = ?";
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
}
