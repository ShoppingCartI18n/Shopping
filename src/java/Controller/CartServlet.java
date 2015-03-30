/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Cart;
import Bean.Product;
import Model.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dattr_000
 */
public class CartServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
    private Cart shop = new Cart();
    HttpSession mysession = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String button = request.getParameter("button2");
        RequestDispatcher rs = null;
        if (button.equals("AddToCart")) {
            String name = request.getParameter("productget");
            ProductModel prom = new ProductModel();
            Product p = prom.getbyName(name);
            int i2 = shop.getIndex(p.getName());
            if (i2 == -1) {
                p.setQuantity(1);
                shop.ins(p);
            } else {
                int count = shop.getIt().get(i2).getQuantity();
                shop.getIt().get(i2).setQuantity(count + 1);
            }
            mysession = request.getSession();
            mysession.setAttribute("itemlist", shop.getIt());
            rs = request.getRequestDispatcher("cart.jsp");
            rs.forward(request, response);
        } else {
            if (button.equals("CheckOut")) {
                mysession.removeAttribute("itemlist");
                mysession.invalidate();
                shop.removeall();
                mysession = request.getSession();
                mysession.setAttribute("itemlist", shop.getIt());
                System.out.println(mysession.getId());
                rs = request.getRequestDispatcher("index.html");
                 rs.forward(request, response);
            } else {
                if (button.equals("Delete")) {
                    String name = request.getParameter("name_del");
                    ProductModel prom = new ProductModel();
                    Product p = prom.getbyName(name);
                    int index = shop.getIndex(p.getName());
                    shop.remove(index);
                    mysession = request.getSession();
                    mysession.setAttribute("itemlist", shop.getIt());
                    rs = request.getRequestDispatcher("cart.jsp");
                     rs.forward(request, response);
                }
            }
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
