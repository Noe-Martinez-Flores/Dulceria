package com.example.Dulceria.controller.paquete;

import com.example.Dulceria.model.paquete.DaoPaquete;
import com.example.Dulceria.model.paquete.Paquete;
import com.example.Dulceria.model.paquete.PaqueteHasProducto;
import com.example.Dulceria.model.producto.DaoProducto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletProductosPaq", value = "/ServletProductosPaq")
public class ServletProductosPaq extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listPaquete", new DaoPaquete().findAll());
        request.setAttribute("listProductos", new DaoProducto().findAll());

        request.getRequestDispatcher("/WEB-INF/screens/paquete/agregarProductoAPaquete.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoPaquete dao = new DaoPaquete();
        PaqueteHasProducto paquete = new PaqueteHasProducto();

        paquete.setPaqueteId(Integer.parseInt(request.getParameter("paquete")));
        paquete.setProductoId(Integer.parseInt(request.getParameter("productoPaq")));
        paquete.setCantidadDeProductos(Integer.parseInt(request.getParameter("cantidad")));

        if (dao.agregarProdAPaquete(paquete)) {
            request.setAttribute("message", "Paquete creado");
        } else {
            request.setAttribute("message", "Paquete no creado");
        }
        doGet(request, response);

    }
}
