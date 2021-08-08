package com.example.Dulceria.controller.personal;

import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.model.personal.DaoPersonal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletConsultaPersonal", value = "/ServletConsultaPersonal")
public class ServletConsultaPersonal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listPersonal", new DaoPersonal().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/empleado/consultaEmpleado.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
