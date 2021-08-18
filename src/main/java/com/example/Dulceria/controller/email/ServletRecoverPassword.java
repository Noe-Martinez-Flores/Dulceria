package com.example.Dulceria.controller.email;

import com.example.Dulceria.model.personal.DaoPersonal;
import com.example.Dulceria.model.personal.Personal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletRecoverPassword", value = "/ServletRecoverPassword")
public class ServletRecoverPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        System.out.println(code);
        int idUser = new DaoPersonal().getIdByCode(code);
        if (idUser != 0){
            request.setAttribute("idUser",idUser);
            request.getRequestDispatcher("/WEB-INF/screens/nuevaContraseña.jsp").forward(request,response);

        }else{
            request.setAttribute("message","notFoundCode");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        int idUser = Integer.parseInt(request.getParameter("idUser"));

        if (password.equals(confirmPassword)){
            DaoPersonal daoPersonal = new DaoPersonal();
            Personal personal = new Personal();

            personal.setId(Integer.parseInt(request.getParameter("idUser")));
            personal.setPassword(request.getParameter("password"));

            if(daoPersonal.updatePassword(personal)){
                request.setAttribute("message","passwordChange");
            }else{
                request.setAttribute("message","notPasswordChange");
            }
            doGet(request,response);

        }else{
            request.setAttribute("message","notEquealsPasswords");
            request.setAttribute("idUser",idUser);
            request.getRequestDispatcher("/WEB-INF/screens/nuevaContraseña.jsp").forward(request,response);
        }
    }
}
