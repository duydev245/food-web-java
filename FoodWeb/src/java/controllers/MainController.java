/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author htduy
 */
public class MainController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // Nhan action
            String act = request.getParameter("action");

            if (act == null) {
                act = "mainindex";
            }
            String url = "";

            // switch action ra tung case
            switch (act) {
                case "welcome":
                    url = "signin.jsp";
                    break;
                case "register":
                    url = "registerForm.jsp";
                    break;               
                case "mainindex":
                    url = "index.jsp";
                    break;              
                case "ERROR":
                    url = "error.jsp";
                    break;
                case "user":
                    url = "userServlet";
                    break;
                case "signin":
                    url = "signinServlet";
                    break;
                case "saveuser":
                    url = "signupServlet";
                    break;
                case "opendish":
                    url = "getItemsServlet";
                    break;
                case "openmenu":
                    url = "getMenusServlet";
                    break;
                case "detailMenu":
                    url = "viewDetailMenuServlet";
                    break;
                case "filterMenus":
                    url = "filterMenusServlet";
                    break;
                case "searchDishes":
                    url = "searchItemsServlet";
                    break;
                case "filterDishes":
                    url = "filterItemsServlet";
                    break;
                case "detailDishes":
                    url = "viewDetailServlet";
                    break;
                case "searchMenu":
                    url = "searchMenuServlet";
                    break;
                case "addtocart":
                    url = "AddToCartServlet";
                    break;
                // ADMIN
                case "adminindex":
                    url = "AdminServlet";
                    break;
                case "userManager":
                    url = "UserManagerServlet";
                    break;
                case "dishManager":
                    url = "DishManagerServlet";
                    break;
                case "orderManager":
                    url = "OrderManagerServlet";
                    break;
                default:
                    break;
            }
            request.getRequestDispatcher(url).forward(request, response);
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
