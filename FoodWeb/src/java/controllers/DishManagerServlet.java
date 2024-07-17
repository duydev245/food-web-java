/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ItemDAO;
import dto.Account;
import dto.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author htduy
 */
public class DishManagerServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("LoginedUser");
        if (acc != null && acc.getRole().equals("admin")) {
            String action = request.getParameter("action");
            ItemDAO d = new ItemDAO();

            try {
                switch (action) {
                    case "add":
                        addItem(request, d);
                        break;
                    case "delete":
                        deleteItem(request, d);
                        break;
                    case "updateStatus":
                        updateItemStatus(request, d);
                        break;
                    case "update":
                        updateItem(request, d);
                        break;
                    default:
                        break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            ArrayList<Item> list = d.getAllItems();
            request.setAttribute("ListDishes", list);
            request.getRequestDispatcher("dishManager.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("403page.jsp").forward(request, response);
        }
    }

    private void addItem(HttpServletRequest request, ItemDAO d) throws Exception {
        String name = request.getParameter("itemName");
        int price = Integer.parseInt(request.getParameter("itemPrice"));
        boolean status = Boolean.parseBoolean(request.getParameter("itemStatus"));
        String desc = request.getParameter("itemDescription");
        String category = request.getParameter("itemCategory");
        int calories = Integer.parseInt(request.getParameter("itemCalories"));
        String image = request.getParameter("itemImage");
        String recipe = request.getParameter("itemRecipe");

        Item newItem = new Item(0, name, price, status, desc, category, calories, image, recipe);
        d.addItem(newItem);
    }

    private void deleteItem(HttpServletRequest request, ItemDAO d) throws Exception {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        d.deleteItem(itemId);
    }

    private void updateItemStatus(HttpServletRequest request, ItemDAO d) throws Exception {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        d.updateItemStatus(itemId);
    }

    private void updateItem(HttpServletRequest request, ItemDAO d)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("itemId"));
        String name = request.getParameter("itemName");
        String description = request.getParameter("itemDescription");
        double price = Double.parseDouble(request.getParameter("itemPrice"));
        boolean status = Boolean.parseBoolean(request.getParameter("itemStatus"));
        String category = request.getParameter("itemCategory");
        int calories = Integer.parseInt(request.getParameter("itemCalories"));
        String image = request.getParameter("itemImage");
        String recipe = request.getParameter("itemRecipe");

        Item item = new Item(id, name, (int) price, status, description, category, calories, image, recipe);
        // Assuming there's a method in DAO to update the item
        d.updateItem(item);
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
