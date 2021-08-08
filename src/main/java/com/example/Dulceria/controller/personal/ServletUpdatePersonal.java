package com.example.Dulceria.controller.personal;

import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.model.personal.DaoPersonal;
import com.example.Dulceria.model.personal.Personal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUpdatePersonal", value = "/ServletUpdatePersonal")
public class ServletUpdatePersonal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String personalId = request.getParameter("id");
        if(personalId != null){
            int id = Integer.parseInt(personalId);
            request.setAttribute("updatePersonal", new DaoPersonal().findById(id));
            request.getRequestDispatcher("/WEB-INF/screens/empleado/updateEmpleado.jsp").forward(request,response);
        }
            request.setAttribute("listPersonal", new DaoPersonal().findAll());
            request.getRequestDispatcher("/WEB-INF/screens/empleado/consultaEmpleado.jsp").forward(request,response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoPersonal daoPersonal = new DaoPersonal();
        Personal personal = new Personal();

        personal.setId(Integer.parseInt(request.getParameter("id")));
        personal.setNombreCompleto(request.getParameter("name"));
        personal.setNombreUsuario(request.getParameter("username"));
        personal.setEmail(request.getParameter("email"));
        personal.setPassword(request.getParameter("pass"));
        personal.setPhoneNumber(request.getParameter("number"));

        if (daoPersonal.updatePersonal(personal)){
            request.setAttribute("message", "Persona Actualizada");
        } else {
            request.setAttribute("message", "Error al actualizar la persona");
        }
        doGet(request, response);
    }
}
