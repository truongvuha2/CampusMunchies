/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author MY LAPTOP
 */
public class EmployeeDAOTest {
    EmployeeDAO emp;
    
    public EmployeeDAOTest() {
        emp = new EmployeeDAO();
    }

    @Test
    public void testIsExisted() {
        boolean result =  emp.isExisted("0123456789", "password1");
        boolean expected = true;
        assertEquals(expected, result);
    }

    @Test
    public void testAdd() {
    }

    @Test
    public void testUpdate() {
    }

    @Test
    public void testRemove() {
    }

    @Test
    public void testGetAll() {
    }

    @Test
    public void testSearchByName() {
    }

    @Test
    public void testSearchByPhone() {
    }

    @Test
    public void testChangePassword() {
    }

    @Test
    public void testMain() {
    }
    
}
