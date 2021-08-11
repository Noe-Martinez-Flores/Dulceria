<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 29/07/2021
  Time: 07:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath(); %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dulcería | Lista de categorias</title>
    <link rel="stylesheet" href="<%=context%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="shortcut icon" href="<%=context%>/assets/calAzuc.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<style>
    @import url('http://fonts.cdnfonts.com/css/chicken-soup?styles=65478');
</style>
<header>
    <div class="fixed-top sticky-top">
        <div class="collapse" id="navbarToggleExternalContent">

            <div class="bg-danger p-4">
                <h5 class="text-white h3">Administrador</h5>
                <hr class="">
                <a class="nav-link active text-white" href="<%=context%>/ServletBackToAdminInicio">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletMarcasTable">Gestion Empleados</a>
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
<div class=" container ">
    <header>
        <h2> <i class="fas fa-user-alt"></i> Gestion de Categorias </h2>
        <hr class="bg-primary">
    </header>
    <div class="row">
        <div class="col-12 ">
            <section>
                <div class="card">
                    <div class="card-header">
                        Categorias Registradas
                    </div>
                    <div>

                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <!-- Define el color de fondo en la cabecera de la tabla -->
                            <thead  style="background: #ed7074">
                            <tr>
                                <td>#</td>
                                <td>Nombre</td>

                                <td class="text-center">Modificar</td>
                                <td class="text-center"> Eliminar</td>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listCategorias}" var="categorias" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>

                                    <td>${categorias.nombreCategoria}</td>


                                    <td class="text-center">
                                        <form method="get" action="<%=context%>/ServletUpdateCategorias">
                                            <input type="hidden" name="id" value="${categorias.id}">
                                            <button title="Modificar" class="btn btn-outline-warning"><i class="fas fa-edit"></i></button>
                                        </form>
                                    </td>

                                    <td class="text-center">
                                        <form method="post" action="<%=context%>/ServletDeleteCategoria">
                                            <input type="hidden" name="id" value="${categorias.id}">
                                            <button title="Eliminar" class="btn btn-outline-danger"><i class="fas fa-times"></i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
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
