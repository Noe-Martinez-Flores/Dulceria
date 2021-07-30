package com.example.Dulceria.controller.categoria;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUpdateCategorias", value = "/ServletUpdateCategorias")
public class ServletUpdateCategorias extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoriaId = request.getParameter("id");

        if(categoriaId != null){
            int id = Integer.parseInt(categoriaId);
            request.setAttribute("categoriaUpdate", new DaoCategoria().findById(id));
            request.getRequestDispatcher("/WEB-INF/screens/categoria/updateCategorias.jsp").forward(request,response);
        } else {
            request.setAttribute("listCategorias", new DaoCategoria().findAll());
            request.getRequestDispatcher("/WEB-INF/screens/categoria/tableCategoria.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoCategoria dao = new DaoCategoria();
        Categoria categoria = new Categoria();

        categoria.setId(Integer.parseInt(request.getParameter("id")));
        categoria.setNombreCategoria(request.getParameter("Nombre_de_la_categoria"));

        if (dao.updateCategoria(categoria)) {
            request.setAttribute("message", "Persona Actualizada");
        } else {
            request.setAttribute("message", "Error al actualizar la persona");
        }
        doGet(request, response);
    }
}
