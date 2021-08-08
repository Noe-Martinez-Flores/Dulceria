package com.example.Dulceria.controller.personal;

import com.example.Dulceria.model.personal.DaoPersonal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeletePersonal", value = "/ServletDeletePersonal")
public class ServletDeletePersonal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listPersonal", new DaoPersonal().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/empleado/consultaEmpleado.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoPersonal daoPersonal = new DaoPersonal();

        int id=Integer.parseInt(request.getParameter("id"));

        if(daoPersonal.deletePersonal(id)){
            request.setAttribute("message","Persona eliminada");
        } else {
            request.setAttribute("message","Error al eliminar");
        }
        doGet(request,response);
    }
}
