/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phath
 */
public class MainController extends HttpServlet {
    public static final String SIGN_UP="SignUpController";
    public static final String ERROR="index.html";
    public static final String LOGIN="LoginController";
    public static final String ADD="AddProductController";
    public static final String SEARCH="ViewProductController";
    public static final String DELETE="DeleteProductController";
    public static final String UPDATE="updateproduct.jsp";
    public static final String CONFIRM="UpdateProductController";
    public static final String LOGOUT="LogoutController";
    public static final String GOOGLE="GoogleController";
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
        String url = ERROR;
        String action = request.getParameter("action");
        try {            
            switch (action) {
                case "Sign Up":
                    url=SIGN_UP;
                    break;
                case "Login":
                    url=LOGIN;
                    break;
                case "Add":
                    url=ADD;
                    break;
                case "Search":
                    url=SEARCH;
                    break;
                case "Delete":
                    url = DELETE;
                    break;
                case "Update":
                    url=UPDATE;
                    break;
                case "Confirm":
                    url=CONFIRM;
                    break;
                case "Log Out":
                    url=LOGOUT;
                    break;
                case "Google":
                    url=GOOGLE;
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
        }finally{
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
