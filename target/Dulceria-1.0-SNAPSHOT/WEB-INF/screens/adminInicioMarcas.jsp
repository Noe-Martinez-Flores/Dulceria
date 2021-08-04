<%--
  Created by IntelliJ IDEA.
  User: familia
  Date: 02/08/2021
  Time: 07:48 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=context%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
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
    <div class="fixed-top">
        <div class="collapse" id="navbarToggleExternalContent">

            <div class="bg-danger p-4">
                <h5 class="text-white h3">Administrador</h5>
                <hr class="">
                <a class="nav-link active text-white" href="">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletCajeroInicio">Gestion Empleados</a>
                <a class="nav-link text-white" href="#">Perfil</a>
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
            <a class="navbar-brand" href="#">
                <img src="<%=context%>/assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top"
                     alt="">
                <span class="textTitle"> La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>

<section style="margin-top: 4rem;" class="container-fluid  shadow ">

    <h1>Bienvenido <span></span></h1>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="producto-tab" type="submit" href="<%=context%>/ServletInicioAdmin"> Productos </a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="marca-tab" data-toggle="tab" href="#marca" role="tab" aria-controls="marca"
               aria-selected="false"> Marcas </a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="categoria-tab" type="submit" href="<%=context%>/ServletConsultarCategoria">Categorias</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="paquete-tab" data-toggle="tab" href="#paquete" role="tab" aria-controls="paquete"
               aria-selected="false">Paquetes</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">

        <div class="tab-pane fade show active" id="marca" role="tabpanel" aria-labelledby="profile-tab">
            <div class="card ">
                <div class="row">
                    <div class="card-header col-6">
                        Marcas Registradas
                    </div>
                    <div class="card-header col-6 text-right">
                        <a href="<%=context%>/ServletAgregarMarcas"
                           class="btn btn-success my-2 my-sm-0 size-font-button" style="margin: right 3rem;"
                           type="submit"> Agregar <i class="fas fa-plus"></i> </a>
                    </div>
                </div>
                <div class="card-body">

                    <br>
                    <table class="table table-hover">

                        <thead style="background: #ed7074">
                        <tr>
                            <td>#</td>
                            <td> Nombre</td>

                            <td class="text-center">Modificar</td>
                            <td class="text-center"> Eliminar</td>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listMarcas}" var="marcas" varStatus="status">
                            <tr>
                                <td>${status.count}</td>

                                <td>${marcas.marcaProducto}</td>


                                <td class="text-center">
                                    <form method="get" action="<%=context%>/ServletUpdateMarcas">
                                        <input type="hidden" name="id" value="${marcas.id}">
                                        <button title="Modificar" style=" height:100%; width: 43%; "
                                                class="btn btn-outline-warning size-font-button"><i
                                                class="fas fa-edit"></i></button>
                                    </form>
                                </td>

                                <td class="text-center">
                                    <form method="post" action="<%=context%>/ServletEliminarMarcas">
                                        <input type="hidden" name="id" value="${marcas.id}">
                                        <button title="Eliminar" style=" height:100%; width: 50%; "
                                                class="btn btn-outline-danger size-font-button"><i
                                                class="fas fa-times"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
</section>

<div class="modal " id="marcaModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="">
        <div class="container">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tittle2">Productos asociados</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead class="bg-danger">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Nombre</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="align-middle">
                            <th class="align-middle" scope="row">1</th>
                            <td class="align-middle">
                                <img style="width: 150px;" src="<%=context%>/assets/bomb.jpg" alt="">
                            </td>
                            <td class="align-middle">Bombones</td>

                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Understood</button>
                </div>
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
