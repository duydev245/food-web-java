/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.OrderDAO;
import dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author htduy
 */
public class OrderManagerServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        OrderDAO orderDAO = new OrderDAO();

        try {
            switch (action) {
                case "searchByDate":
                    searchOrdersByDate(request, orderDAO);
                    break;
                case "searchByCustomerInfo":
                    searchOrdersByCustomerInfo(request, orderDAO);
                    break;
                case "groupByAddress":
                    groupOrdersByAddress(request, orderDAO);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("orderManager.jsp").forward(request, response);
    }

    private void searchOrdersByDate(HttpServletRequest request, OrderDAO orderDAO) throws Exception {
        Date date = Date.valueOf(request.getParameter("orderDate"));
        List<Order> orders = orderDAO.searchOrdersByDate(date);
        request.setAttribute("OrderList", orders);
    }

    private void searchOrdersByCustomerInfo(HttpServletRequest request, OrderDAO orderDAO) throws Exception {
        String customerInfo = request.getParameter("customerInfo");
        List<Order> orders = orderDAO.searchOrdersByCustomerInfo(customerInfo);
        request.setAttribute("OrderList", orders);
    }

    private void groupOrdersByAddress(HttpServletRequest request, OrderDAO orderDAO) throws Exception {
        Map<String, List<Order>> ordersGroupedByAddress = orderDAO.getOrdersGroupedByAddress();
        request.setAttribute("OrdersGroupedByAddress", ordersGroupedByAddress);
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
        processRequest(request, response);
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
