/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.DAO_E;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "NewProductServlet", urlPatterns = {"/newproduct"})
public class NewProductServlet extends HttpServlet {

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
            out.println("<title>Servlet NewProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewProductServlet at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        String r_t = request.getParameter("type");
        String r_co = request.getParameter("color");
        String r_b = request.getParameter("brand");
        String r_ca = request.getParameter("category");
        String r_price = request.getParameter("price");
        String des = request.getParameter("des");
        String img = request.getParameter("img");
        int t, co, b, ca;
        double price;
        if (r_t == null || r_co == null || r_b == null || r_ca == null) {
            String noti = "hoan thien thong tin";
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("newproduct.jsp").forward(request, response);
        } else {
            try {
                t = Integer.parseInt(r_t);
                co = Integer.parseInt(r_co);
                b = Integer.parseInt(r_b);
                ca = Integer.parseInt(r_ca);
                price = Double.parseDouble(r_price);
                DAO_E d = new DAO_E();
                d.addNewProduct(name, t, co, b, price, des, ca, img);
            } catch (NumberFormatException e) {

            }
        }
        DAO d = new DAO();
        List<Product> lp = d.getAllProduct(null);
        request.setAttribute("pid", lp.get(lp.size()-1).getId());
        request.getRequestDispatcher("newproduct.jsp").forward(request, response);
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
