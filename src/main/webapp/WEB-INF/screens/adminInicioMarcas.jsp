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
                <a class="nav-link active text-white" href="<%=context%>/ServletInicioAdmin">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletGestionEmpleados">Gestion Empleados</a>
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
                <span class="text-white h3 "> La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>

<section style="margin-top: 4rem;" class="container-fluid  shadow ">

    <h1>Bienvenido <span></span></h1>
    <ul class="nav nav-tabs" id="myTab" role="tablist">

        <li class="nav-item" role="presentation">
            <a class="nav-link" id="marca-tab" data-toggle="tab" href="#marca" role="tab" aria-controls="marca"
               aria-selected="false"> Marcas </a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="categoria-tab" type="submit" href="<%=context%>/ServletConsultarCategoria">Categorias</a>
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
                        <button data-toggle="modal" data-target="#marcaModalAgregar" href="<%=context%>/ServletAgregarMarcas"
                           class="btn btn-success my-2 my-sm-0 size-font-button" style="margin: right 3rem;"
                           type="submit"> Agregar <i class="fas fa-plus"></i> </button>
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
                                                class="btn btn-warning size-font-button"><i
                                                class="fas fa-edit"></i></button>
                                    </form>
                                </td>

                                <td class="text-center">
                                    <form method="post" action="<%=context%>/ServletEliminarMarcas">
                                        <input type="hidden" name="id" value="${marcas.id}">
                                        <button title="Eliminar" style=" height:100%; width: 50%; "
                                                class="btn btn-danger size-font-button"><i
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

<div class="modal border-top-2" id="marcaModalAgregar" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="container">
        <div class="modal-content">
            <div class="modal-header bg-danger">

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<%=context%>/ServletAgregarMarcas" method="post">
                    <div class="row">
                        <div class="col text-center">
                            <label class=""  > Nueva Marca </label>
                            <input type="text" id="Marca_del_producto" name="Marca_del_producto" class="form-control" placeholder="Nombre de la Marca">
                        </div>
                    </div>
                    <div style="text-align: center" class="col-12 pt-2">
                        <button  type="submit" class="btn btn-primary size-font-button"> ¡Agregar! </button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">cerrar</button>

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
