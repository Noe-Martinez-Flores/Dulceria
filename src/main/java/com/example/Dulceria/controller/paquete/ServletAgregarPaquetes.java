package com.example.Dulceria.controller.paquete;

import com.example.Dulceria.model.caducLote.DaoCaducLote;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletAgregarPaquetes", value = "/ServletAgregarPaquetes")
public class ServletAgregarPaquetes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listProducto", new DaoCaducLote().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/paquete/agregarPaquetes.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
