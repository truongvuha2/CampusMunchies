/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;

/**
 *
 * @author khang
 */
public class CustomerUpdateHistory extends HttpServlet {

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
            out.println("<title>Servlet CustomerUpdateHistory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerUpdateHistory at " + request.getContextPath() + "</h1>");
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
        OrderDAO o = new OrderDAO();
        List<Order> orders = o.getAll();
        PrintWriter out = response.getWriter();
        if (orders != null) {
            for (Order order : orders) {
                String a = "";
                if (order.getStatus().equals("Waiting")) {
                    a = "<button class=\"col-md-6 btn btn-primary\" onclick= \"deleteOrder('" + order.getId() + "')\" class=\"btn btn-outline-secondary\"\n"
                            + "                                                                            >Cancel Order</button>";
                }
                out.println(" <tr>\n"
                        + "                                                    <th scope=\"row\" class=\"align-middle\">\n"
                        + "                                                        <div>\n"
                        + "                                                            <div class=\"ml-2 d-inline-block align-top\">\n"
                        + "                                                                <h5>" + order.getId() + "</h5>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div>\n"
                        + "                                                    </th>\n"
                        + "                                                    <td class=\"align-middle\">\n"
                        + "                                                        <div class=\"ml-2 d-inline-block align-top\">\n"
                        + "                                                            <h5>" + order.getStatus() + "</h5>\n"
                        + "                                                        </div>\n"
                        + "                                                    </td>\n"
                        + "                                                    <td class=\"align-middle\">\n"
                        + "                                                        <div class=\"ml-0 d-inline-block align-top\">\n"
                        + "                                                            <h5>" + order.getOrderDate() + "</h5>\n"
                        + "                                                        </div>\n"
                        + "                                                    </td>\n"
                        + "\n"
                        + "                                                    <td class=\"align-middle\">\n"
                        + "                                                        <div class=\"ml-4 d-inline-block align-top\">\n"
                        + "                                                            <h5>$ " + order.getTotal() + "</h5>\n"
                        + "                                                        </div>\n"
                        + "                                                    </td>\n"
                        + "                                                    <td class=\"mt-0\">\n"
                        + "                                                        <div class=\"container\">\n"
                        + "                                                            <button class=\"col-md-5 btn btn-primary\"  onclick= \"viewOrder('"+order.getId()+"')\" class=\"btn btn-outline-secondary\"\n"
                        + "                                                                    >Show</button>\n"
                        + a
                        + "                                                        </div>\n"
                        + "\n"
                        + "                                                    </td>\n"
                        + "                                                </tr>");
            }
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
