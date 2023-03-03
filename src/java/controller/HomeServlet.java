/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Brand;
import model.Cart;
import model.Category;
import model.Color;
import model.Item;
import model.Product;
import model.Type;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
        String sortPrice = request.getParameter("sortPrice");
        String sort = null;
        if (sortPrice != null) {
            if (sortPrice.equals("asc")) {
                sort = "asc";
            } else {
                sort = "desc";
            }
            request.setAttribute("sort", sort);
        }

        DAO dao = new DAO();

        // all category
        List<Category> category = dao.getAllCategory();
        // all type
        List<Type> type = dao.getAllType();
        // all brand
        List<Brand> brand = dao.getAllBrand();
        // all color
        List<Color> color = dao.getAllColor();
        //all product
        List<Product> product = dao.getAllProduct(sort);
        //cookie
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a != null) {
            Cookie[] arrc = request.getCookies();
            String txt = "";
            if (arrc != null) {
                for (Cookie o : arrc) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, product);
            List<Item> items = cart.getItems();
            int n;
            if (items != null) {
                n = items.size();
            } else {
                n = 0;
            }
            request.setAttribute("sizeCart", n);
        }

        //pagination
        int numPro = product.size();
        int numPerPage = 8;
        int numPage = numPro / numPerPage + (numPro % numPerPage == 0 ? 0 : 1);
        int start, end, page;
        String tpage = request.getParameter("page");
        try {
            page = Integer.parseInt(tpage);

        } catch (NumberFormatException e) {
            page = 1;
        }
        start = (page - 1) * numPerPage;
        if (page * numPerPage > numPro) {
            end = numPro;
        } else {
            end = page * numPerPage;
        }

        List<Product> arr = dao.getListByPage(product, start, end);
        request.setAttribute("productPage", arr);
        request.setAttribute("numPage", numPage);
        request.setAttribute("page", page);
        //

        request.setAttribute("category", category);
        request.setAttribute("type", type);
        request.setAttribute("brand", brand);
        request.setAttribute("color", color);
        request.setAttribute("product", product);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
