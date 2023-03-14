/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="UpdateServlet", urlPatterns={"/updateproduct"})
public class UpdateServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String _pid = request.getParameter("pid");
        int id = 0;
        try {
            id = Integer.parseInt(_pid);
        } catch (Exception e) {
        }
        DAO d = new DAO();
        Product product = d.getProductById(id, null);
        request.setAttribute("product", product);
        List<Size> sizeAll = d.getAllSize(id);
        request.setAttribute("sizeAll", sizeAll);
        List<Type> typeAll = d.getAllType();
        request.setAttribute("typeAll", typeAll);
        List<Color> colorAll = d.getAllColor();
        request.setAttribute("colorAll", colorAll);
        List<Brand> brandAll = d.getAllBrand();
        request.setAttribute("brandAll", brandAll);
        
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String _id = request.getParameter("id");
        String name = request.getParameter("name");
        String _price = request.getParameter("price");
        String description = request.getParameter("description");
        String _type = request.getParameter("type");
        String _color = request.getParameter("color");
        String _brand = request.getParameter("brand");
        List<Size> size = new ArrayList<>();
        DAO d = new DAO();
        
        try {
            int id = Integer.parseInt(_id);
            double price = Double.parseDouble(_price);
            int type = Integer.parseInt(_type);
            int color = Integer.parseInt(_color);
            int brand = Integer.parseInt(_brand);
            
            Product product = new Product(id, name, type, color, brand, price, null, description, 0, null);
            
            List<Size> sizeAll =  d.getAllSize(id);
            for (Size s : sizeAll) {
                String _quantity = request.getParameter(s.getName());
                int quantity = Integer.parseInt(_quantity);
                size.add(new Size(s.getName(), quantity, id));
            }
            
//            request.setAttribute("okok", size);
            
            d.updateProduct(product, size);
            request.setAttribute("pid", id);
//            request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
            response.sendRedirect("updateproduct?pid="+id);
        } catch (NumberFormatException e) {
        }
    }
    
   
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
