package com.example.Dulceria.controller;

import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletMarcasTable", value = "/ServletMarcasTable")
public class ServletMarcasTable extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("id") != null){
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("aMarca", new DaoMarcas().findById(id));
            request.getRequestDispatcher("/WEB-INF/view/actualizarMarcas.jsp").forward(request,response);
        }
        request.setAttribute("listMarcas", new DaoMarcas().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/tablaMarcas.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoMarcas dao = new DaoMarcas();
        Marcas marcas = new Marcas();

        marcas.setMarcaProducto(request.getParameter("Marca_del_producto"));

        if (dao.createMarca(marcas)) {
            request.setAttribute("message", "Persona Registrada");
        } else {
            request.setAttribute("message", "Error al registrar");
        }
        doGet(request, response);
    }
}
