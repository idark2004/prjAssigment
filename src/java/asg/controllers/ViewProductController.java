/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.controllers;

import asg.daos.ProductDAO;
import asg.dtos.ProductDTO;
import asg.dtos.SearchError;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phath
 */
public class ViewProductController extends HttpServlet {

    public static final String ERROR = "index.html";
    public static final String SUCCESS = "viewproduct.jsp";
    public static final String ADMIN = "fullcontrol.jsp";

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
        SearchError msg = new SearchError();
        try {
            ProductDAO dao = new ProductDAO();
            String roleID = request.getParameter("roleID");
            String categoryID = request.getParameter("categoryID");
            String search = request.getParameter("search");
            String status = request.getParameter("status");
            List<ProductDTO> list = dao.view(status,search,categoryID);
            if (list != null) {
                request.setAttribute("PRODUCT_LIST", list);
                if ("GU".equals(roleID) || roleID.isEmpty()) {
                    url = SUCCESS;
                } else if ("AD".equals(roleID)) {
                    url = ADMIN;
                }
            } else{
                msg.setMsg("No product(s) found!");
                request.setAttribute("EMPTY_LIST", msg);
                if ("GU".equals(roleID) || roleID.isEmpty()) {
                    url = SUCCESS;
                } else if ("AD".equals(roleID)) {
                    url = ADMIN;
                }
            }
        } catch (Exception e) {
        } finally {
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
