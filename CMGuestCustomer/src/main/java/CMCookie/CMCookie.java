/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CMCookie;

import dao.CustomerDAO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author khang
 */
public class CMCookie {

    public static void getNameCustomer(HttpServletRequest request, HttpServletResponse response) {
        CustomerDAO c = new CustomerDAO();
        Cookie[] cookies = request.getCookies();
        String phone = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("phone")) {
                phone = cookie.getValue();
                break;
            }
        }
        String name = c.searchByPhone(phone).getName();
        request.setAttribute("name", name);
    }
}
