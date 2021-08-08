package com.example.Dulceria.controller.categoria;

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
        request.setAttribute("listCategorias", new DaoCategoria().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/adminInicioCategoria.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoCategoria dao = new DaoCategoria();
        Categoria categoria = new Categoria();

        categoria.setNombreCategoria(request.getParameter("Nombre_de_la_categoria"));

        if (dao.createCategoria(categoria)) {
            request.setAttribute("message", "Categoria Registrada");
        } else {
            request.setAttribute("message", "Error al registrar");
        }
        doGet(request, response);
    }
}
