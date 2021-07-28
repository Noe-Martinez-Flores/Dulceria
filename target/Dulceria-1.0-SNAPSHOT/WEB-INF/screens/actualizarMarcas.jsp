<%@ page import="com.example.Dulceria.model.marca.Marcas" %><%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 27/07/2021
  Time: 06:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath(); %>
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
    <title>Dulceria</title>
</head>
<body>
<header>
    <div class="fixed-top">
        <div class="collapse" id="navbarToggleExternalContent">

            <div class="bg-danger p-4">
                <h5 class="text-white h3">Administrador</h5>
                <hr class="">
                <a class="nav-link active text-white" href="<%=context%>/ServletBackToAdminInicio">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="#">Gestion Empleados</a>
                <a class="nav-link text-white" href="#">Pricing</a>
                <a class="nav-link text-white text-right" href="<%=context%>/ServletBackToIndex" tabindex="-1" aria-disabled="true"><i data-feather="power"></i> Cerrar Sesion </a>
            </div>
        </div>
        <nav class="navbar navbar-dark bg-danger">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent"
                    aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img src="<%=context%>/assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top"
                     alt="">
                <span >La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>
<div  style="margin-top: 4rem;"><a href="<%=context%>/ServletInicioAdmin">Consultas</a><span>/ Agregar nuevo</span></div>
<div class="container">
    <%Marcas marcas = (Marcas) request.getAttribute("aMarca");%>
    <form action="<%=context%>/ServletUpdateMarcas" method="post">
        <div class="row">
            <div class="col text-center">
                <label class="" for="" > Nueva Marca </label>
                <input type="text" id="Marca_del_producto" name="Marca_del_producto" class="form-control" value="<%=marcas.getMarcaProducto()%>" placeholder="Nombre de la Marca">
            </div>

            <button type="submit" class="btn btn-primary"><h4> ¡Modificar! </h4>> </button>
        </div>
    </form>
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
