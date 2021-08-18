package com.example.Dulceria.controller.email;

import com.example.Dulceria.model.personal.DaoPersonal;
import com.example.Dulceria.util.Email;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.invoke.SwitchPoint;

@WebServlet(name = "ServletSendEmail", value = "/ServletSendEmail")
public class ServletSendEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = new DaoPersonal().updateCodePersonal(email);
        String createIp = request.getRequestURL() + "";
        String ip = createIp.replaceAll(request.getServletPath(),"/ServletRecoverPassword");

        switch (code){
            case "fail":
                    request.setAttribute("message","error");
                break;
            case "notFoundEmail":
                    request.setAttribute("message","notFoundEmail");
                    request.getRequestDispatcher("/WEB-INF/screens/restablecerContraseña.jsp").forward(request,response);
                break;
            default:
                if(new Email().sendRecoverPassword(email,code,ip)){
                    request.getRequestDispatcher("/index.jsp").forward(request,response);
                }else{
                    request.setAttribute("message","error al enviar el correo");
                    request.getRequestDispatcher("/WEB-INF/screens/restablecerContraseña.jsp").forward(request,response);

                }
        }
    }
}
