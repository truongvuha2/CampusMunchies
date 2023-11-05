/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import dao.EmployeeDAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Customer;
import model.Employee;

/**
 *
 * @author MY LAPTOP
 */
public class EmployeeController extends HttpServlet {

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
            out.println("<title>Servlet EmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String folder = "/EmployeePage";
        String path = request.getRequestURI();
        OrderDAO ordDAO = new OrderDAO();
        String phone = request.getSession().getAttribute("phone") + "";
        if (path.endsWith("/employee/login")) {
            request.getRequestDispatcher(folder + "/login.jsp").forward(request, response);
        } else if (path.endsWith("/employee/orderList")) {

//            ResultSet rs =  ordDAO.getAll();
            ResultSet rs = ordDAO.getOrderByEmployeePhone(phone);

            request.setAttribute("rs", rs);
            request.getRequestDispatcher(folder + "/orderList.jsp").forward(request, response);
        } else if (path.startsWith("/employee/customerInfo")) {
            String[] data = path.split("/");
            String customerPhone = data[data.length - 1];
            String orderDetailId = data[data.length - 2];
            CustomerDAO cusDAO = new CustomerDAO();
            ResultSet order = ordDAO.getOrderByCustomerPhone(customerPhone);
            request.setAttribute("order", order);
            Customer customerInfo = cusDAO.searchByPhone(customerPhone);
            request.setAttribute("customerInfo", customerInfo);

            request.setAttribute("orderDetailId", orderDetailId);
            request.getRequestDispatcher(folder + "/customerInfo.jsp").forward(request, response);
        } else if (path.startsWith("/employee/searchByOrderId")) {
            try {
                String orderId = request.getParameter("orderId");
                ResultSet rs = ordDAO.getOrderById(orderId, phone);
                String searchResultHtml = "<tbody id=\"itemList\">";

                while (rs.next()) {
                    searchResultHtml += "<tr align=\"center\">";
                    searchResultHtml += "<td>" + rs.getString("ord_id") + "</td>";
                    String status = rs.getString("ord_status");
                    searchResultHtml += "<td>";

                    if (status.equals("Preparing")) {
                        searchResultHtml += "<div class=\"btn btn-warning\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Completed")) {
                        searchResultHtml += "<div class=\"btn btn-success\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Waiting")) {
                        searchResultHtml += "<div class=\"btn btn-warning\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Rejected")) {
                        searchResultHtml += "<div class=\"btn btn-secondary\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Cancelled")) {
                        searchResultHtml += "<div class=\"btn btn-danger\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    }

                    searchResultHtml += "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_date") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("cus_name") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("cus_phone") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_type") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_pay") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_total") + "</td>";
                    searchResultHtml += "<td><a class=\"btn btn-outline-primary\" id=\"btnView\" href=\"/orderDetail/" + rs.getString("ord_id") + "\" style=\"font-weight: bold; font-size: 25px\">View</a></td>";
                    searchResultHtml += "</tr>";
                }

                searchResultHtml += "</tbody>";
                response.setContentType("text/html");
                response.getWriter().write(searchResultHtml);
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (path.endsWith("/employee/logout")) {
            session.removeAttribute("phone");
            session.removeAttribute("fullname");
            session.invalidate();
            request.getRequestDispatcher(folder + "/login.jsp").forward(request, response);
        } else if (path.endsWith("/employee/login/fail")) {
            String loginError = "The phone or password is incorrect!";
            request.setAttribute("loginError", loginError);
            request.getRequestDispatcher(folder + "/login.jsp").forward(request, response);
        } else if (path.endsWith("/employee/updateProfile")) {
            request.getRequestDispatcher(folder + "/updateProfile.jsp").forward(request, response);
        } else if (path.endsWith("/employee/updateProfileSuccess")) {
            request.setAttribute("result", "Update Profile Successfully!");
            request.getRequestDispatcher(folder + "/updateProfile.jsp").forward(request, response);
        } else if (path.endsWith("/employee/updateProfileFail")) {
            request.setAttribute("result", "Update Profile Fail!");
            request.getRequestDispatcher(folder + "/updateProfile.jsp").forward(request, response);
        } else if (path.endsWith("/employee/newOrderList")) {
            request.getRequestDispatcher(folder + "/newOrderList.jsp").forward(request, response);
        } else if (path.endsWith("/employee/changePassword")) {
            request.getRequestDispatcher(folder + "/changePassword.jsp").forward(request, response);
        } else if (path.endsWith("/employee/changePasswordSuccess")) {
            request.setAttribute("result", "Password is changed successfully!");
            request.getRequestDispatcher(folder + "/changePassword.jsp").forward(request, response);
        } else if (path.endsWith("/employee/changePasswordFail")) {
            request.setAttribute("result", "Old password is incorrect! Please Try Again!");
            request.getRequestDispatcher(folder + "/changePassword.jsp").forward(request, response);
        } else if (path.startsWith("/employee/takeOrder/")) {
            String[] data = path.split("/");
            String orderId = data[data.length - 1];
            ordDAO.setPhoneForOrder(phone, orderId);
            response.sendRedirect("/employee/orderList");
        } else if (path.endsWith("/employee/forgotPass")) {
            request.getRequestDispatcher(folder + "/enterEmailForgotPass.jsp").forward(request, response);
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
        String folder = "/EmployeePage";
        String btnLogin = request.getParameter("btnLogin");
        String btnSearch = request.getParameter("btnSearch");
        String btnUpdateStatus = request.getParameter("btnUpdateStatus");
        String btnUpdateProfile = request.getParameter("btnUpdateProfile");
        String btnChangePassword = request.getParameter("btnChangePassword");
        String btnForgotPass = request.getParameter("btnForgot");
        EmployeeDAO empDAO = new EmployeeDAO();
        OrderDAO ordDAO = new OrderDAO();
        if (btnLogin != null && btnLogin.equals("login")) {
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            Employee emp = empDAO.login(phone, password);
            if (emp!=null) {
                request.getSession().setAttribute("fullname", emp.getName());
                request.getSession().setAttribute("phone", phone);
                response.sendRedirect("/employee/orderList");
            } else {
                response.sendRedirect("/employee/login/fail");
            }
        }
        if (btnSearch != null && btnSearch.equals("Search")) {
            String employeePhone = request.getSession().getAttribute("phone") + "";
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            ResultSet searchList = ordDAO.searchOrderByDate(startDate, endDate, employeePhone);
            request.setAttribute("rs", searchList);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.getRequestDispatcher(folder + "/orderList.jsp").forward(request, response);
        }
        if (btnUpdateStatus != null && btnUpdateStatus.equals("Update")) {
            String[] statusValues = request.getParameterValues("status");
            String orderId = request.getParameter("orderId");
            String selectedStatus = "";
            if (statusValues != null) {
                selectedStatus = statusValues[0];
            }
            int kq = ordDAO.updateOrderStatus(orderId, selectedStatus);
            if (kq != 0) {
                response.sendRedirect("/orderDetail/updateSuccess/" + orderId);
            } else {
                response.sendRedirect("/orderDetail/updateFail/" + orderId);
            }
        }
        if (btnUpdateProfile != null && btnUpdateProfile.equals("Update")) {
            int kq = 0;
            String txtPhone = request.getParameter("txtPhone");
            String txtName = request.getParameter("txtName");
            String txtEmail = request.getParameter("txtEmail");
            String txtAddress = request.getParameter("txtAddress");
            String txtBirthday = request.getParameter("txtBirthday");
            String txtCreateDay = request.getParameter("txtCreateDay");
            kq = empDAO.updateProfile(txtPhone, txtName, txtEmail, txtAddress, txtBirthday, txtCreateDay);
            if (kq != 0) {
                request.getSession().setAttribute("fullname", txtName);
                response.sendRedirect("/employee/updateProfileSuccess");
            } else {
                response.sendRedirect("/employee/updateProfileFail");
            }
        }
        if (btnChangePassword != null && btnChangePassword.equals("ChangePassword")) {
            String oldPassword = request.getParameter("txtOldPassword");
            String newPassword = request.getParameter("txtNewPassword");
            String phone = (String) request.getSession().getAttribute("phone");
            Employee correctOldPass = empDAO.login(phone, oldPassword);
            if (correctOldPass!=null) {
                empDAO.changePassword(phone, newPassword);
                response.sendRedirect("/employee/changePasswordSuccess");
            } else {
                response.sendRedirect("/employee/changePasswordFail");
            }
        }
        if (btnForgotPass != null && btnForgotPass.equals(("forgotPass"))) {
            String pass = ramdomPassword();

            String email = request.getParameter("email");
            Employee c = empDAO.checkEmployeeEmail(email);

            if (c != null) {

                String to = email;
                String subject = "New Password";
                String body = "<html><body>"
                        + "<p>Dear " + c.getName() + " ,</p>"
                        + "<p>Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn trên CampusMuchies. "
                        + "<p>Mật khẩu mới của bạn là: " + pass + "</p>"
                        + "<p>Trân trọng,<br>"
                        + "Đội ngũ cửa hàng</p>"
                        + "</body></html>";
                empDAO.updateEmployeePass(pass, email);
                boolean result = sendEmail(to, subject, body);

                if (result) {
                    request.setAttribute("error", "Your New Password is in your email! Please check it!");
                    request.getRequestDispatcher(folder + "/enterEmailForgotPass.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher(folder + "/enterEmailForgotPass.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Your email is not registed! Please try again!");
                request.getRequestDispatcher(folder + "/enterEmailForgotPass.jsp").forward(request, response);
            }
        }
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

    private boolean sendEmail(String to, String subject, String body) {
        // Cấu hình các thông tin cần thiết để gửi email
        String host = "smtp.gmail.com";
        String port = "587";
        String username = "campusmunchies666@gmail.com";
        String password = "cxvqreikknzyrzac";
        final String finalUsername = username;
        final String finalPassword = password;

        // Thiết lập các thuộc tính cho kết nối SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Tạo đối tượng Authenticator để xác thực người dùng
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(finalUsername, finalPassword);
            }
        };

        // Tạo phiên gửi email
        Session s = Session.getInstance(props, authenticator);

        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(s);

            // Đặt thông tin người gửi và người nhận
            message.setFrom(new InternetAddress(username));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Đặt tiêu đề và nội dung email
            message.setSubject(subject, "UTF-8");
            message.setContent(body, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);

            return true;
        } catch (MessagingException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private String ramdomPassword() {
        Random rd = new Random();
        String c = "12356789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 9; i++) {
            int rdIndex = rd.nextInt(c.length());
            char rdChar = c.charAt(rdIndex);
            sb.append(rdChar);
        }
        return sb.toString();
    }
}
