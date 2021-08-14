<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 31/07/2021
  Time: 06:57 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<!DOCTYPE html>
<% String context = request.getContextPath(); %>

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
    <title>Dulceria</title>
</head>

<body>
<style>
    @import url('http://fonts.cdnfonts.com/css/chicken-soup?styles=65478');
</style>

<header>
    <div class="fixed-top sticky-top">
        <div class="collapse" id="navbarToggleExternalContent">
            <div class="bg-danger p-4">
                <h5 class="text-white h4">Cajero</h5>
                <a class="nav-link active" href="<%=context%>/ServletBackToIndex">Home <span class="sr-only">(current)</span></a>
                <a class="nav-link" href="#">Features</a>
                <a class="nav-link" href="#">Pricing</a>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </div>
        </div>
        <nav class="navbar navbar-dark bg-danger">
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand text-center" style="margin-left: 10rem" href="#">
                <span class="textTitle"> Bienvenido </span>
            </a>
            <a class="navbar-brand text-center" >${sessionScope.user.nombreDeUsuario}</a>
            <a class="navbar-brand" href="#">
            <img src="<%=context%>/assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top"
                 alt="">
            <span class="text-white h3 "> La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>
<section class="container-fluid topCard">
    <h2 class="text-center">Ventas</h2>
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="BUSCAR" aria-label="Search">
        <button type="button" class="btn btn-outline-success my-2 my-sm-0"><span data-feather="shopping-cart"></span> Agregar al carrito</button>
    </form>
    <br>
    <table class="table">
        <thead class="btn-danger">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Producto </th>
            <th scope="col">Precio</th>
            <th scope="col">cantidad</th>
            <th scope="col">Eliminar</th>
        </tr>
        </thead>
        <tbody>
        <tr class="align-middle">
            <th class="align-middle" scope="row">1</th>
            <td class="align-middle">bombones
            </td>
            <td class="align-middle">50</td>
            <td class="align-middle">12</td>
            <td class="align-middle"><button type="button" class="btn btn-outline-danger">Quitar</button>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="text-center footer row">
        <div class=" text-right col-4 col-xl-7"><button type="button" class="btn btn-outline-success my-2 my-sm-0"><span data-feather="shopping-cart"></span> Realizar la venta</button>
        </div>
        <div class="col-2 col-xl-2"><button type="button" class="btn btn-outline-danger">Cancelar</button>
        </div>
        <div class="col-4 col-xl-1"> <label for="">Total a pagar: $</label>
        </div>
        <div class="col-2 col-xl-2"><input type="text" class="form-control my-2 my-sm-0" placeholder="50">
        </div>


    </div>
</section>
<script src="https://unpkg.com/feather-icons"></script>
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