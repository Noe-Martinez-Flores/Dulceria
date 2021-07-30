package com.example.Dulceria.controller.categoria;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.categoria.DaoCategoria;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletConsultarCategoria", value = "/ServletConsultarCategoria")
public class ServletConsultarCategoria extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listCategorias", new DaoCategoria().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/categoria/tableCategoria.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
