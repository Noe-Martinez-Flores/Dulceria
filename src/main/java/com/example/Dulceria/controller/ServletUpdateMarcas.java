package com.example.Dulceria.controller;

import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUpdateMarcas", value = "/ServletUpdateMarcas")
public class ServletUpdateMarcas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String marcaId = request.getParameter("id");

        if(marcaId != null){
            int id = Integer.parseInt(marcaId);
            request.setAttribute("marcaUpdate", new DaoMarcas().findById(id));
            request.getRequestDispatcher("/WEB-INF/screens/marca/actualizarMarcas.jsp").forward(request,response);
        } else {
            request.setAttribute("listMarcas", new DaoMarcas().findAll());
            request.getRequestDispatcher("/WEB-INF/screens/tablaMarcas.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoMarcas dao = new DaoMarcas();
        Marcas marcas = new Marcas();

        marcas.setId(Integer.parseInt(request.getParameter("id")));
        marcas.setMarcaProducto(request.getParameter("Marca_del_producto"));

        if (dao.updateMarca(marcas)) {
            request.setAttribute("message", "Persona Actualizada");
        } else {
            request.setAttribute("message", "Error al actualizar la persona");
        }
        doGet(request, response);
    }
}
