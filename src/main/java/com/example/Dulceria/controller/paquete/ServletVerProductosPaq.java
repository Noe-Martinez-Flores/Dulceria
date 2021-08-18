package com.example.Dulceria.controller.paquete;

import com.example.Dulceria.model.paquete.DaoPaquete;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletVerProductosPaq", value = "/ServletVerProductosPaq")
public class ServletVerProductosPaq extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idPaquete = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("paquete", new DaoPaquete().retornarPaquete(idPaquete));
        request.setAttribute("listProd", new DaoPaquete().consultarProdPaq(idPaquete));
        request.getRequestDispatcher("/WEB-INF/screens/paquete/VerProductosPaq.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
