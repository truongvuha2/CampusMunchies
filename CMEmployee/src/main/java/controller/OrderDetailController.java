/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;

/**
 *
 * @author MY LAPTOP
 */
public class OrderDetailController extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailController at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        String folder = "/EmployeePage";
        String phone = request.getSession().getAttribute("phone") + "";
        if (path.startsWith("/orderDetail/updateSuccess")) {
            String[] data = path.split("/");
            String id = data[data.length - 1];
            OrderDetailDAO odd = new OrderDetailDAO();
            OrderDAO ord = new OrderDAO();

            ResultSet order = ord.getCusOfOrder(id);
            request.setAttribute("orderInfo", order);

            ResultSet orderDetailList = odd.getListOrderDetailById(id);
            request.setAttribute("orderDetailList", orderDetailList); //danh sách sản phẩm chi tiết của order
            request.setAttribute("orderId", id);
            request.setAttribute("result", "Update Status Success!");
            request.getRequestDispatcher(folder + "/orderDetail.jsp").forward(request, response);
            
        } else if (path.startsWith("/orderDetail/updateFail")) {
            String[] data = path.split("/");
            String id = data[data.length - 1];
            OrderDetailDAO odd = new OrderDetailDAO();
            OrderDAO ord = new OrderDAO();

            ResultSet order = ord.getCusOfOrder(id);
            request.setAttribute("orderInfo", order);

            ResultSet orderDetailList = odd.getListOrderDetailById(id);
            request.setAttribute("orderDetailList", orderDetailList); //danh sách sản phẩm chi tiết của order
            request.setAttribute("orderId", id);
            request.setAttribute("result", "Update Status Fail!");
            request.getRequestDispatcher(folder + "/orderDetail.jsp").forward(request, response);
            
        } else if (path.startsWith("/orderDetail")) {
            String[] data = path.split("/");
            String id = data[data.length - 1];
            OrderDetailDAO odd = new OrderDetailDAO();
            OrderDAO ord = new OrderDAO();

            ResultSet order = ord.getCusOfOrder(id);
            request.setAttribute("orderInfo", order);

            ResultSet orderDetailList = odd.getListOrderDetailById(id);
            request.setAttribute("orderDetailList", orderDetailList); //danh sách sản phẩm chi tiết của order
            request.setAttribute("orderId", id);
            request.getRequestDispatcher(folder + "/orderDetail.jsp").forward(request, response);
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
