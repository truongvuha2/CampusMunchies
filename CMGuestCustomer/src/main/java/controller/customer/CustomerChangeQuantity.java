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
        String s = "<div class=\"px-4 px-lg-0\">\n"
                + "\n"
                + "                <div class=\"pb-5\">\n"
                + "                    <div class=\"container\">\n"
                + "                        <div class=\"row\">\n"
                + "                            <div class=\"col-lg-12 p-5 bg-white rounded shadow-sm mb-5\">\n"
                + "\n"
                + "                                <!-- Shopping cart table -->\n"
                + "                                <div class=\"table-responsive\">\n"
                + "                                    <table class=\"table\">\n"
                + "                                        <thead>\n"
                + "                                            <tr>\n"
                + "                                                <th scope=\"col\" class=\"border-0 bg-light\">\n"
                + "                                                    <div class=\"p-2 px-3 text-uppercase\">Food</div>\n"
                + "                                                </th>\n"
                + "                                                <th scope=\"col\" class=\"border-0 bg-light\">\n"
                + "                                                    <div class=\"py-2 text-uppercase\">Price</div>\n"
                + "                                                </th>\n"
                + "                                                <th scope=\"col\" class=\"border-0 bg-light\">\n"
                + "                                                    <div class=\"py-2 text-uppercase\">Quantity</div>\n"
                + "                                                </th>\n"
                + "                                                <th scope=\"col\" class=\"border-0 bg-light\">\n"
                + "                                                    <div class=\"py-2 text-uppercase\">Delete</div>\n"
                + "                                                </th>\n"
                + "                                            </tr>\n"
                + "                                        </thead>\n"
                + "                                        <tbody id=\"body\">\n";
        double totalAll = 0;
        double totalPrice = 0;
        for (Cart o : carts) {
            totalPrice = o.getFood().getRealPrice() * o.getQuantity();
            totalPrice = (double) Math.round(totalPrice * 100) / 100;
            totalAll += totalPrice;
            s += "  <tr>\n"
                    + "                                                        <th scope=\"row\">\n"
                    + "                                                            <div class=\"p-2\">\n"
                    + "                                                                <img src=\"" + o.getFood().getImg() + "\" alt=\"\" width=\"70\" class=\"img-fluid rounded shadow-sm\">\n"
                    + "                                                                <div class=\"ml-3 d-inline-block align-middle\">\n"
                    + "                                                                    <h5 class=\"mb-0\"> <a href=\"foodDetail?id=" + o.getFood().getId() + "\" class=\"text-dark d-inline-block\">" + o.getFood().getName() + "</a></h5><span class=\"text-muted font-weight-normal font-italic\"></span>\n"
                    + "                                                                </div>\n"
                    + "                                                            </div>\n"
                    + "                                                        </th>\n"
                    + "                                                        <td class=\"align-middle\"><strong>$" + totalPrice + "</strong></td>\n"
                    + "\n"
                    + "                                                        <td class=\"align-middle\">\n"
                    + "                                                            <button onclick=\"decQuantity('" + o.getQuantity() + "', '" + o.getFood().getId() + "')\" class=\"btnSub btn\">-</button>\n"
                    + "                                                            <strong>" + o.getQuantity() + "</strong>\n"
                    + "                                                            <button onclick=\"incQuantity('" + o.getQuantity() + "', '" + o.getFood().getId() + "')\" class=\"btnAdd btn\">+</button>"
                    + "                                                        </td>\n"
                    + "                                                        <td class=\"align-middle\">"
                    + "                                                              <button type=\"button\" class=\"btn btn-danger\" onclick=\"deleteFood('" + o.getQuantity() + "', '" + o.getFood().getId() + "')\" >X</button> \n"
                    + "                                                            </a>\n"
                    + "                                                        </td>\n"
                    + "                                                    </tr>\n ";
        }
        totalAll = (double) Math.round(totalAll * 100) / 100;
        s += "   </tbody>\n"
                + "                                    </table>\n"
                + "                                </div>\n"
                + "                                <!-- End -->\n"
                + "                            </div>\n"
                + "                        </div>\n"
                + "\n"
                + "                        <div class=\"row py-5 p-4 bg-white rounded shadow-sm\">\n"
                + "                            <div class=\"col-lg-6\">\n"
                + "                                <div class=\"bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold\">Voucher</div>\n"
                + "                                <div class=\"p-4\">\n"
                + "                                    <div class=\"input-group mb-4 border rounded-pill p-2\">\n"
                + "                                        <input type=\"text\" placeholder=\"Enter Voucher\" aria-describedby=\"button-addon3\" class=\"form-control border-0\">\n"
                + "                                        <div class=\"input-group-append border-0\">\n"
                + "                                            <button id=\"button-addon3\" type=\"button\" class=\"btn btn-dark px-4 rounded-pill\"><i class=\"fa fa-gift mr-2\"></i>Use</button>\n"
                + "                                        </div>\n"
                + "                                    </div>\n"
                + "                                </div>\n"
                + "                            </div>\n"
                + "                            <div class=\"col-lg-6\">\n"
                + "                                <div class=\"bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold\">Total Payment</div>\n"
                + "                                <div class=\"p-4\">\n"
                + "                                    <ul class=\"list-unstyled mb-4\">\n"
                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Price</strong><strong >$" + totalAll + "</strong></li>\n"
                + "\n"
                + "                                    </ul><a href=\"purchase\" class=\"btn btn-dark rounded-pill py-2 btn-block\">Buy</a>\n"
                + "                                </div>\n"
                + "                            </div>\n"
                + "                        </div>\n"
                + "\n"
                + "                    </div>\n"
                + "                </div>";
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
