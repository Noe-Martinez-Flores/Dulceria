package com.example.Dulceria.controller;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletAgregarCategoria", value = "/ServletAgregarCategoria")
public class ServletAgregarCategoria extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/screens/agregarCategoria.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoCategoria dao = new DaoCategoria();
        Categoria categoria = new Categoria();

        categoria.setNombre_de_la_categoria(request.getParameter("Nombre_de_la_categoria"));

        if (dao.createCategoria(categoria)) {
            request.setAttribute("message", "Persona Registrada");
        } else {
            request.setAttribute("message", "Error al registrar");
        }
        doGet(request, response);
    }
}
