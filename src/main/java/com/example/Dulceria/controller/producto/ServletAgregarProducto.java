package com.example.Dulceria.controller.producto;

import com.example.Dulceria.model.marca.DaoMarcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletAgregarProducto", value = "/ServletAgregarProducto")
public class ServletAgregarProducto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/screens/producto/registrarProducto.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
