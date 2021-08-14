package com.example.Dulceria.controller.marcas;

import com.example.Dulceria.model.marca.DaoMarcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletSearchMarcas", value = "/ServletSearchMarcas")
public class ServletSearchMarcas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String marca = request.getParameter("buscMarc");
        request.setAttribute("listMarcas", new DaoMarcas().findMarcas(marca));
        request.getRequestDispatcher("/WEB-INF/screens/adminInicioMarcas.jsp").forward(request,response);
    }
}
