package com.example.Dulceria.controller.marcas;

import com.example.Dulceria.model.marca.DaoMarcas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletEliminarMarcas", value = "/ServletEliminarMarcas")
public class ServletEliminarMarcas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listMarcas",new DaoMarcas().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/adminInicioMarcas.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoMarcas dao = new DaoMarcas();

        int id=Integer.parseInt(request.getParameter("id"));


        if (dao.deleteMarca(id)){
            request.setAttribute("message","Marca eliminada");
        }else{
            request.setAttribute("message","Error al eliminar");
        }
        doGet(request,response);
    }
}
