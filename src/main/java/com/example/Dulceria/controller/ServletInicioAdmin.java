package com.example.Dulceria.controller;

import com.example.Dulceria.model.producto.DaoProducto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletInicioAdmin", value = "/ServletInicioAdmin")
public class ServletInicioAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listProd", new DaoProducto().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/adminInicio.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("correcto");
        String producto = request.getParameter("buscProd");
        request.setAttribute("listProd", new DaoProducto().findProductos(producto));
        request.getRequestDispatcher("/WEB-INF/screens/adminInicio.jsp").forward(request,response);
    }
}
