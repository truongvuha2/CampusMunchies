/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.FoodDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Food;

/**
 *
 * @author khang
 */
public class CustomerSearch extends HttpServlet {

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
            out.println("<title>Servlet CustomerSearch</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerSearch at " + request.getContextPath() + "</h1>");
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
        FoodDAO f = new FoodDAO();
        String name = request.getParameter("txt");
        List<Food> foods = f.searchByName(name);
        PrintWriter out = response.getWriter();
        if (foods.size() != 0) {
            for (Food food : foods) {
                String x = "";
                String b = "";
                if (food.getSale() > 0) {
                    b = "<p>$" + food.getRealPrice() + "<del>$" + food.getPrice() + "</del></p>";
                } else {
                    b = "<p>$" + food.getPrice() + "<p>";
                }
                if (food.getStatus().equals("Sold Out")) {
                    x = "<span style=\"color:grey\">Sold Out</span>";
                } else {
                    x = "<button class=\"cart\" onclick=\"addToCart()\">\n"
                            + "                                                    <i class=\"fas fa-shopping-cart cart-icon\"></i>\n"
                            + "                                                </button>\n";
                }
                out.println("<div class=\"food-item col-lg-3 col-md-4 col-sm-6 col-12\">\n"
                        + "                            <div class=\"food-border\">\n"
                        + "                                <div class=\"food-image col-lg-12 col-md-12 col-sm-12 col-4\">\n"
                        + "                                    <img src=\"" + food.getImg() + "\" alt=\"\" srcset=\"\">\n"
                        + "                                </div>\n"
                        + "                                <div class=\"food-details col-lg-12 col-md-12 col-sm-12 col-8\">\n"
                        + "                                    <p class=\"name\">" + food.getName() + "</p>\n"
                        + "                                    <p class=\"price\">" + b + "</p>\n"
                        + "                                    <div class=\"food-button\">\n"
                        +                                                   x
                        + "                                        <button class=\"detail\" onclick=\"getDetail('" + food.getId() + "')\">\n"
                        + "                                            <i class=\"fas fa-info-circle\"></i>\n"
                        + "                                        </button>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>"
                );
            }
        } else {
            out.println("<style>.centered-text {\n"
                    + "  display: flex;\n"
                    + "  justify-content: center;\n"
                    + "  align-items: center; \n"
                    + "  height: 60vh;\n"
                    + "text-align:center"
                    + "} </style>"
                    + "<h1 class=\"centered-text col-12\">No food is found<h1>");
        }
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
