/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

<<<<<<< HEAD
import dao.CustomerDAO;
import dao.OrderDAO;
=======
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Order;
=======
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0

/**
 *
 * @author Admin
 */
public class CustomerDetails extends HttpServlet {

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
<<<<<<< HEAD
            out.println("<title>Servlet CustomerDetails</title>");
=======
            out.println("<title>Servlet CustomerDetails</title>");            
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerDetails at " + request.getContextPath() + "</h1>");
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
<<<<<<< HEAD
        try {
            CustomerDAO customerDao = new CustomerDAO();
            OrderDAO orderDao = new OrderDAO();
            List<Order> listOrderCus = new ArrayList<>();

            String phone = request.getParameter("cid");
            request.setAttribute("phoneCus", phone);
            Customer infoCustomer = customerDao.getCustomerDetail(phone);
            request.setAttribute("infoCus", infoCustomer);
            String dateBirthday = formatTime(infoCustomer.getBirthday());
            String dateCreate = formatTime(infoCustomer.getCreate_date());
            request.setAttribute("birthday", dateBirthday);
            request.setAttribute("dateCreate", dateCreate);
            request.setAttribute("statusAcc", infoCustomer.getCus_status());

            listOrderCus = orderDao.getOrderHistory(phone);
            request.setAttribute("historyOrder", listOrderCus);

            request.getRequestDispatcher("customerDetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public String formatTime(Date time) {
        SimpleDateFormat outputFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date = time;
        String formatted = outputFormat.format(date);
        return formatted;
=======
        processRequest(request, response);
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
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
<<<<<<< HEAD

=======
        processRequest(request, response);
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
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
