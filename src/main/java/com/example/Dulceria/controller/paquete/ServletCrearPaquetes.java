package com.example.Dulceria.controller.paquete;

import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.model.paquete.DaoPaquete;
import com.example.Dulceria.model.paquete.Paquete;
import com.example.Dulceria.model.producto.DaoProducto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCrearPaquetes", value = "/ServletCrearPaquetes")
public class ServletCrearPaquetes extends HttpServlet {
    String namePaquete = null;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listPaquete", new DaoPaquete().findAll());

        request.setAttribute("listProductos", new DaoProducto().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/paquete/agregarProductoAPaquete.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoPaquete dao = new DaoPaquete();
        Paquete paquete= new Paquete();

        paquete.setNombrePaquete(request.getParameter("namePaquete"));
        namePaquete=request.getParameter("namePaquete");
        paquete.setCantidadUnidadesPaquete(Integer.parseInt(request.getParameter("cantidadPaquetes")));
        paquete.setPrecioPaquete(Double.parseDouble(request.getParameter("precioPaquete")));
        if (dao.crearPaquete(paquete)) {
            request.setAttribute("message", "Paquete creado");
        } else {
            request.setAttribute("message", "Paquete no creado");
        }
        doGet(request, response);
    }
}
