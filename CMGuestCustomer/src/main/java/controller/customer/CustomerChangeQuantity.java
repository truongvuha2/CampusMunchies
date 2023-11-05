/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;

/**
 *
 * @author khang
 */
public class CustomerChangeQuantity extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerChangeQuantity</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerChangeQuantity at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = CMCookie.CMCookie.getCustomerPhone(request, response);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String status = request.getParameter("status");
        String foodID = request.getParameter("foodId");
        CartDAO c = new CartDAO();
        if (status.equals("true")) {
            c.updateQuantity(quantity + 1, phone, foodID);
        } else if (status.equals("false")) {
            if (quantity > 1) {
                c.updateQuantity(quantity - 1, phone, foodID);
            }
        } else {
            c.deleteCart(phone, foodID);
        }

        List<Cart> carts = c.searchByPhone(phone);
        PrintWriter out = response.getWriter();
        double totalPriceFood = 0;
        double sum = 0;
        String s = "  <div class=\"header\">           \n"
                + "                    <div class=\"name-tittle\">\n"
                + "                        Cart\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "                <!-- Orders Food Information Table -->\n"
                + "                <div class=\"orders-table\">\n"
                + "                    <table>\n"
                + "                        <thead>\n"
                + "                            <tr>\n"
                + "                                <th colspan=\"2\">Food</th>\n"
                + "                                <th>Price</th>\n"
                + "                                <th>Quantity</th>\n"
                + "                                <th colspan=\"2\"></th>\n"
                + "                            </tr>\n"
                + "                        </thead>"
                + "                  <tbody>";
        for (Cart cart : carts) {
            totalPriceFood = cart.getFood().getRealPrice() * cart.getQuantity();
            totalPriceFood = (double) Math.round(totalPriceFood * 100) / 100;
            sum += totalPriceFood;
            s += "    <tr>\n"
                    + "                                    <td class=\"food-info\">\n"
                    + "                                        <img src=\"" + cart.getFood().getImg() + "\" alt=\"\">\n"
                    + "                                    </td>\n"
                    + "                                    <td style=\"font-size: 23px;\"> <a href=\"#\">" + cart.getFood().getName() + "</a> </td>\n"
                    + "                                    <td>" + totalPriceFood + "$</td>\n"
                    + "                                    <td>\n"
                    + "                                        <box class=\"quantity mt-2\">\n"
                    + "                                            <button style=\"font-weight: 100; color: black;\" class=\"btn btn-sub\" onclick=\"decQuantity(" + cart.getQuantity() + ", '" + cart.getFood().getId() + "')\">-</button>\n"
                    + "                                            <span style=\"margin-top: 30px;padding: 20px;\" id=\"quantity\" class=\"mx-2\" >" + cart.getQuantity() + "</span>\n"
                    + "                                            <button style=\"font-weight: 600; color: black;\" class=\"btn btn-plus\" onclick=\"incQuantity(" + cart.getQuantity() + ", '" + cart.getFood().getId() + "')\">+</button>\n"
                    + "                                        </box>\n"
                    + "                                     </td>\n"
                    + "                                    <td>\n"
                    + "                                <!-- View detail -->\n"
                    + "                                        <a class=\"btn\" href=\"foodDetail?id=" + cart.getFood().getId() + "\">\n"
                    + "                                            <ion-icon style=\"font-size: 28px;\" name=\"create\"></ion-icon>\n"
                    + "                                         </a>\n"
                    + "                                    </td>\n"
                    + "                            <td>\n"
                    + "                                <button style=\"background-color:transparent; border:none\"  onclick=\"deleteFood(" + cart.getQuantity() + ",'" + cart.getFood().getId() + "')\">\n"
                    + "                                    <ion-icon style=\"font-size: 28px;\" name=\"trash-bin\"></ion-icon>\n"
                    + "                                </button>\n"
                    + "                            </td>\n"
                    + "                            </tr>";
        }
        sum = (double) Math.round(sum * 100) / 100;
        String x = !carts.isEmpty() ? "<div class=\"btn-order\">\n"
                + "                            <button  onclick=\"order()\" style=\"font-size: 20px;\">Order</button>\n"
                + "                        </div>" : "";
        s += " </tbody>\n"
                + "                    </table>\n"
                + "                </div>\n"
                + "                <!-- End of Food Order Information Orders -->\n"
                + "                <ul class=\"other-info\">\n"
                + "                    <li>\n"
                + "                        <h2 style=\"font-weight: 600; color: #C21010;\" class=\"customer-info\">Voucher</h2>\n"
                + "                        <div class=\"search-main\">\n"
                + "                            <div class=\"search-container\">\n"
                + "                                <input type=\"text\" class=\"search-box\" id=\"searchInput\" placeholder=\"Enter Voucher...\">\n"
                + "                                <button class=\"voucher\"><ion-icon name=\"gift\"></ion-icon>Use</button>\n"
                + "                            </div>\n"
                + "                        </div>\n"
                + "                    </li>\n"
                + "                    <li>\n"
                + "                        <div class=\"header-info\">\n"
                + "                            <h2 style=\" font-weight: 600; color: #C21010;\" class=\"customer-info\">Total Payment</h2>\n"
                + "                        </div>\n"
                + "                        <span>\n"
                + "                            <div class=\"info\">\n"
                + "                                <p style=\"font-size: 20px;\"><span class=\"bold-numbers\">Total Food Cost: </span>" + sum + "$</p>\n"
                + "                            </div>\n"
                + "                            <div class=\"info\">\n"
                + "                                <p style=\"font-size: 20px; \"><span class=\"bold-numbers\">Voucher: </span>-0$</p>\n"
                + "                            </div>\n"
                + "                            <hr>\n"
                + "                            <p style=\"font-size: 25px; font-weight: 500; color: #C21010;\"><span class=\"bold-numbers\">Total\n"
                + "                                    Order:</span>" + sum + "$</p>\n"
                + "                        </span>\n"
                + x+"                     \n"
                + "                    </li>\n"
                + "                </ul>";
        out.print(s);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
