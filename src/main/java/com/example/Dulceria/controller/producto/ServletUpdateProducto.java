package com.example.Dulceria.controller.producto;

import com.example.Dulceria.model.caducLote.CaducLote;
import com.example.Dulceria.model.caducLote.DaoCaducLote;
import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.model.marca.DaoMarcas;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.model.personal.DaoPersonal;
import com.example.Dulceria.model.producto.DaoProducto;
import com.example.Dulceria.model.producto.Producto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUpdateProducto", value = "/ServletUpdateProducto")
public class ServletUpdateProducto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productoId = request.getParameter("id");
        if (productoId != null){
            int id = Integer.parseInt(productoId);
            request.setAttribute("product", new DaoProducto().findById(id));
            request.setAttribute("listMarcas", new DaoMarcas().findAll());
            request.setAttribute("listCategorias", new DaoCategoria().findAll());
            request.getRequestDispatcher("/WEB-INF/screens/producto/modificarProducto.jsp").forward(request,response);
        }else{
            request.setAttribute("listProd", new DaoProducto().findAll());
            request.getRequestDispatcher("/WEB-INF/screens/adminInicio.jsp").forward(request,response);

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoCaducLote daoCaducLote = new DaoCaducLote();
        CaducLote caducLote = new CaducLote();

        int idMarcas = Integer.parseInt(request.getParameter("marca"));
        int idCategorias = Integer.parseInt(request.getParameter("categoria"));

        System.out.println(idMarcas);
        System.out.println(idCategorias);

        caducLote.setId(Integer.parseInt(request.getParameter("idCaducLote")));
        caducLote.setFechaCaducidad(request.getParameter("fechaCaducidad"));
        caducLote.setNumeroLote(request.getParameter("numeroLote"));



        int idCaducLote = Integer.parseInt(request.getParameter("idCaducLote"));
        String fechaCaducidad = request.getParameter("fechaCaducidad");
        String numeroLote = request.getParameter("numeroLote");

        System.out.println(idCaducLote);
        System.out.println(fechaCaducidad);
        System.out.println(numeroLote);




        Producto producto = new Producto();

        producto.setId(Integer.parseInt(request.getParameter("idProducto")));
        producto.setNombreProducto(request.getParameter("nameProducto"));
        producto.setCantidadUnidades(Integer.parseInt(request.getParameter("cantidadUnidades")));
        producto.setPrecioMenudeo(Double.parseDouble(request.getParameter("precioMenudeo")));
        producto.setPrecioMayoreo(Double.parseDouble(request.getParameter("precioMayoreo")));




        int idpro = Integer.parseInt(request.getParameter("idProducto"));
        String nomPro = request.getParameter("nameProducto");
        int canUnidades = Integer.parseInt(request.getParameter("cantidadUnidades"));
        double precioMenu = Double.parseDouble(request.getParameter("precioMenudeo"));
        double precioMayo = Double.parseDouble(request.getParameter("precioMayoreo"));

        System.out.println(idpro);
        System.out.println(nomPro);
        System.out.println(canUnidades);
        System.out.println(precioMenu);
        System.out.println(precioMayo);





        Marcas marcas = new Marcas();
        marcas.setId(idMarcas);
        producto.setMarcasId(marcas);





        Categoria categoria = new Categoria();
        categoria.setId(idCategorias);
        producto.setCategoriasId(categoria);


        caducLote.setProducto(producto);

        if (daoCaducLote.updateProducto(caducLote)){
            System.out.println("llego");
            request.setAttribute("message","succesUpdateProducto");
        }else{
            System.out.println("no llego");
            request.setAttribute("message","errorUpdateProducto");
        }
        doGet(request, response);
    }
}
