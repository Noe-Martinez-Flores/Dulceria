<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 05/08/2021
  Time: 09:05 p. m.
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
                <a class="nav-link active text-white" href="<%=context%>/ServletInicioAdmin">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletCreatePersonal">Gestion Empleados</a>
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

<div class="tab-pane fade show active" id="categoria" role="tabpanel" aria-labelledby="contact-tab">
    <div class="card">
        <div class="row">
            <div class="card-header col-6">
                Personal
            </div>

        </div>
        <div class="card-body">

            <br>
            <table class="table table-hover">

                <thead style="background: #ed7074">
                <tr>
                    <td>#</td>
                    <td>Nombre</td>
                    <td>Usuario</td>
                    <td>correo</td>
                    <td>telefono</td>

                    <td class="text-center">Modificar</td>
                    <td class="text-center"> Eliminar</td>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listPersonal}" var="personal" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${personal.nombreCompleto}</td>
                        <td>${personal.nombreUsuario}</td>
                        <td>${personal.email}</td>
                        <td>${personal.phoneNumber}</td>

                        <td class="text-center">
                            <form method="get" action="<%=context%>/ServletUpdatePersonal">
                                <input type="hidden" name="id" value="${personal.id}">
                                <button title="Modificar"
                                class="btn btn-warning size-font-button"><i
                                    class="fas fa-edit"></i></button>
                            </form>
                        </td>

                        <td class="text-center">
                            <form method="post" action="<%=context%>/ServletDeletePersonal">
                                <input type="hidden" name="id" value="${personal.id}">
                                <button title="Eliminar"
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
