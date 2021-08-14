package com.example.Dulceria.controller.producto;

import com.example.Dulceria.model.caducLote.CaducLote;
import com.example.Dulceria.model.caducLote.DaoCaducLote;
import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.model.producto.Producto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletAgregarProducto", value = "/ServletAgregarProducto")
public class ServletAgregarProducto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listCategorias", new DaoCategoria().findAll());
        request.setAttribute("listMarcas", new DaoMarcas().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/producto/registrarProducto.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoCaducLote daoCaducLote = new DaoCaducLote();
        CaducLote caducLote = new CaducLote();

        int idMarcas = Integer.parseInt(request.getParameter("marca"));
        int idCategorias = Integer.parseInt(request.getParameter("categoria"));


        caducLote.setFechaCaducidad(request.getParameter("fechaCaducidad"));
        caducLote.setNumeroLote(request.getParameter("numeroLote"));

        Producto producto = new Producto();

        producto.setNombreProducto(request.getParameter("nameProducto"));
        producto.setCantidadUnidades(Integer.parseInt(request.getParameter("cantidadUnidades")));
        producto.setPrecioMenudeo(Double.parseDouble(request.getParameter("precioMenudeo")));
        producto.setPrecioMayoreo(Double.parseDouble(request.getParameter("precioMayoreo")));

        caducLote.setProducto(producto);

        Marcas marcas = new Marcas();
        marcas.setId(idMarcas);
        producto.setMarcasId(marcas);

        Categoria categoria = new Categoria();
        categoria.setId(idCategorias);
        producto.setCategoriasId(categoria);

        if (daoCaducLote.createFechaCaducLote(caducLote)){
            request.setAttribute("message","succesInsertProducto");
        }else{
            request.setAttribute("message","errorInsertProducto");
        }
        doGet(request, response);
    }
}
