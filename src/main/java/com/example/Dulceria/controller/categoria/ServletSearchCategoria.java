package com.example.Dulceria.controller.categoria;

import com.example.Dulceria.model.categoria.DaoCategoria;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletSearchCategoria", value = "/ServletSearchCategoria")
public class ServletSearchCategoria extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoria = request.getParameter("buscCat");
        request.setAttribute("listCategorias", new DaoCategoria().findCategoria(categoria));
        request.getRequestDispatcher("/WEB-INF/screens/adminInicioCategoria.jsp").forward(request,response);
    }
}
