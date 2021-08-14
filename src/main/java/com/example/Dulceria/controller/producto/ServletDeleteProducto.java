package com.example.Dulceria.controller.producto;

import com.example.Dulceria.model.producto.DaoProducto;
import com.example.Dulceria.model.producto.Producto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeleteProducto", value = "/ServletDeleteProducto")
public class ServletDeleteProducto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listProd", new DaoProducto().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/adminInicio.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoProducto daoProducto = new DaoProducto();
        Producto producto = new Producto();

        int idProducto = Integer.parseInt(request.getParameter("id"));
        System.out.println(idProducto);

        if (daoProducto.deleteProducto(idProducto)){
            request.setAttribute("message","succesDeleteProducto");
        }else{
            request.setAttribute("message","failDeleteProducto");
        }
        doGet(request,response);
    }
}
