package com.example.Dulceria.controller;

import com.example.Dulceria.model.Inicio.DaoInicio;
import com.example.Dulceria.model.Inicio.Inicio;
import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.producto.DaoProducto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLogin", value = "/ServletLogin")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuarioLogin");
        String password = request.getParameter("passLogin");
        Inicio user = new Inicio();
        System.out.println(usuario);
        System.out.println(password);
        user = new DaoInicio().login(usuario,password);

        if(user.getMessage().equals("fail")){
            request.setAttribute("message", user.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }else{
            HttpSession session = request.getSession(true);
            session.setAttribute("user",user);

            switch (user.getRol().getPuesto()){
                case "Administrador":
                    //request.setAttribute("listProductos", new DaoProductos().findAll());
                    request.setAttribute("listProd", new DaoProducto().findAll());
                    request.getRequestDispatcher("/WEB-INF/screens/adminInicio.jsp").forward(request,response);
                    break;

                case "Cajero":

                    request.getRequestDispatcher("/WEB-INF/screens/cajero/cajeroInicio.jsp").forward(request,response);
                    break;

            }
        }
    }
}
