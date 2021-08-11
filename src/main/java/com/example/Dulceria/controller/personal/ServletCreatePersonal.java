package com.example.Dulceria.controller.personal;

import com.example.Dulceria.model.personal.DaoPersonal;
import com.example.Dulceria.model.personal.Personal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCreatePersonal", value = "/ServletCreatePersonal")
public class ServletCreatePersonal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/screens/gestionEmpleados.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("pass");
        String confirmPass = request.getParameter("confirmPassword");
        if (password.equals(confirmPass)){
            DaoPersonal daoPersonal = new DaoPersonal();
            Personal personal = new Personal();

            personal.setNombreCompleto(request.getParameter("name"));
            personal.setNombreUsuario(request.getParameter("username"));
            personal.setEmail(request.getParameter("email"));
            personal.setPassword(request.getParameter("pass"));
            personal.setPhoneNumber(request.getParameter("number"));

            if (daoPersonal.createPersonal(personal)){
                request.setAttribute("message", "succesInsert");
            }else{
                request.setAttribute("message", "Error al registrar");
            }
            doGet(request, response);
        }else{
            request.setAttribute("message","notEquealsPassword");
            request.getRequestDispatcher("/WEB-INF/screens/gestionEmpleados.jsp").forward(request,response);
        }

    }
}
