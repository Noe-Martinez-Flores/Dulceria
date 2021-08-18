<%--
  Created by IntelliJ IDEA.
  User: familia
  Date: 02/08/2021
  Time: 08:34 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=context%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="shortcut icon" href="<%=context%>/assets/calAzuc.png" type="image/x-icon">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="http://fonts.cdnfonts.com/css/chicken-soup" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <title>Consultas</title>
</head>

<body>
<style>
    @import url('http://fonts.cdnfonts.com/css/chicken-soup?styles=65478');
</style>
<header>
    <div class="fixed-top sticky-top">
        <div class="collapse" id="navbarToggleExternalContent">

            <div class="bg-danger p-4">
                <h5 class="text-white h3">Administrador</h5>
                <hr class="">
                <a class="nav-link active text-white" href="">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletGestionEmpleados">Gestion Empleados</a>
                <a class="nav-link text-white" href="<%=context%>/ServletMarcasTable">Marcas y Categorias</a>
                <a class="nav-link text-white text-right" href="<%=context%>/ServletBackToIndex" tabindex="-1"
                   aria-disabled="true"><i data-feather="power"></i> Cerrar Sesion </a>
            </div>
        </div>
        <nav class="navbar navbar-dark bg-danger">
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarToggleExternalContent"
                    aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand text-center" style="margin-left: 10rem" href="#">
                <span class="textTitle"> Bienvenido </span>
            </a>
            <a class="navbar-brand" href="#">
                <img src="<%=context%>/assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top"
                     alt="">
                <span class="text-white h3 "> La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>

<section style="margin-top: 4rem;" class="container-fluid  shadow ">

    <h1>Bienvenido <span></span></h1>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="productos" type="submit" href="<%=context%>/ServletInicioAdmin">Productos</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="paquetes-tab" type="submit" href="<%=context%>/ServletToPaquetes">Paquetes</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="producto" role="tabpanel" aria-labelledby="home-tab">
            <div class="card">
                <div class="row">
                    <div class="card-header col-6">
                        Paquetes Registrados
                    </div>

                    <div class="card-header col-3 text-right">
                        <a href="<%=context%>/ServletAgregarPaquetes"
                           class="btn btn-success my-2 my-sm-0 size-font-button" style="margin: right 3rem;"
                           type="submit"> Crear un paquete <i class="fas fa-plus"></i>  </a>
                    </div>
                    <div class="card-header col-3 text-right">
                        <a href="<%=context%>/ServletCrearPaquetes"
                           class="btn btn-success my-2 my-sm-0 size-font-button" style="margin: right 3rem;"
                           type="submit"> Agregar productos a un paquete <i class="fas fa-plus"></i>  </a>
                    </div>
                </div>
                <div class=" col-12 col-md-8">
                    <form method="post" action="<%=context%>/ServletInicioAdmin" class="form-inline my-2 my-lg-0">

                        <div class=" mr-1">
                            <input class="form-control mr-sm-2 " autocomplete="on" formaction="/ServletProductos"
                                   type="search"
                                   placeholder="BUSCAR" aria-label="Search" id="buscProd" name="buscProd">

                        </div>

                        <button class="btn btn-outline-success my-2 my-sm-0 " type="submit"><span
                                data-feather="search"></span> Buscar
                        </button>




                    </form>
                </div>
                <div class="card-body">

                    <br>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <!-- Define el color de fondo en la cabecera de la tabla -->
                            <thead  style="background: #ed7074">

                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre del Paquete</th>
                                <th scope="col">Productos</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad de Paquetes</th>
                                <th scope="col">Modificar</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                            </thead>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listPaquete}" var="prod" varStatus="status">
                                <tr>

                                    <td>${status.count}</td>
                                    <td>${prod.paquete.nombrePaquete}</td>
                                    <td>
                                        <form method="get" action="<%=context%>/ServletVerProductosPaq">
                                            <input type="hidden" name="id" value="${prod.paquete.id}">
                                            <button title="Ver Productos" class="btn btn-secondary">Ver Productos</button>
                                        </form>
                                    </td>
                                    <td>${prod.paquete.precioPaquete}</td>
                                    <td>${prod.paquete.cantidadUnidadesPaquete}</td>


                                    <td class="text-center">
                                        <form method="get" action="<%=context%>/ServletUpdateProducto">
                                            <input type="hidden" name="id" value="${prod.producto.id}">
                                            <button title="Modificar" class="btn btn-warning"><i class="fas fa-edit"></i></button>
                                        </form>
                                    </td>

                                    <td class="text-center">
                                        <form method="post" action="<%=context%>/ServletDeleteProducto">
                                            <input type="hidden" name="id" value="${prod.producto.id}">
                                            <button title="Eliminar" class="btn btn-danger"><i class="fas fa-times"></i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <!-- Button trigger modal -->


                    </div>

                </div>
            </div>

        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="productoModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tittle1">Detalles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <label class="text-center" value="">Nombre</label>
                <br>
                <img style="width: 150px;" src="<%=context%>/assets/bomb.jpg" alt="">

            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-warning">Modificar</button>
                <button type="button" class="btn btn-danger">Eliminar</button>

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
</script>
<script src="<%=context%>/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js"
        crossorigin="anonymous"></script>
<script src="<%=context%>/js/candy.js"></script>
<script>
    feather.replace()
</script>
</body>

</html>

