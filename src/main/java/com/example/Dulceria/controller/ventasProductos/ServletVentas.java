package com.example.Dulceria.controller.ventasProductos;

import com.example.Dulceria.model.paquete.DaoPaquete;
import com.example.Dulceria.model.producto.DaoProducto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

import static com.sun.deploy.trace.Trace.print;

@WebServlet(name = "ServletVentas", value = "/ServletVentas")
public class ServletVentas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String tipo = request.getParameter("tipo");
        String cantidad = request.getParameter("cantidad");
        String lista1 = request.getParameter("lista");


        ArrayList<String> lista = (ArrayList<String>) request.getAttribute("lista");

        ArrayList<ArrayList> nodeList = new ArrayList<ArrayList>();

        //System.out.println(lista);
        if (lista != null){
            for (int i = 0; i < lista.size(); i++) {
                System.out.println(lista.get(i));
            }
        }

        //System.out.println(lista);

        ArrayList<String> items = new ArrayList<String>();

        items.add(id);
        items.add(tipo);
        items.add(cantidad);

        //nodeList.add(lista);
        nodeList.add(items);
        System.out.println(lista);
        System.out.println(lista1);
        //System.out.println(nodeList);
        //ArrayList list = new ArrayList();
        //list.add(items);



        //System.out.println(nodeList);

        request.setAttribute("lista", nodeList);
        request.setAttribute("listProductos", new DaoProducto().findAll());
        request.setAttribute("lisPaquetes", new DaoPaquete().findAll());
        request.getRequestDispatcher("/WEB-INF/screens/cajero/cajeroInicio.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
