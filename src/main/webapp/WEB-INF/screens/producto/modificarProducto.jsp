<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 08/08/2021
  Time: 08:28 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath();
%>
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
    <title>Modificar Producto</title>
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
                <a class="nav-link active text-white" href="<%=context%>/ServletBackToAdminInicio">Principal<span
                        class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="#">Gestion Empleados</a>
                <a class="nav-link text-white" href="#">Perfil</a>
                <a class="nav-link text-white text-right" href="" tabindex="-1" aria-disabled="true"><i
                        data-feather="power"></i> Cerrar Sesion </a>
            </div>
        </div>
        <nav class="navbar navbar-dark bg-danger">
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img src="../assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top" alt="">
                <span class="textTitle"> La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>

<section style="margin-top: 4rem;" class="container-fluid  shadow ">

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link " id="home-tab" data-toggle="tab" href="#producto" role="tab"
               aria-controls="producto" aria-selected="true">Empleados</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#marca" role="tab" aria-controls="marca"
               aria-selected="false">Marcas</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#categoria" role="tab"
               aria-controls="categoria" aria-selected="false">Categorias</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#paquete" role="tab"
               aria-controls="paquete" aria-selected="false">Paquetes</a>
        </li>
    </ul>
    <br>
</section>

<section>
    <article>
        <div class="card position-relative text-center" style="width: 100%;">
            <div class="card-header">
                <small class="text-success">
                    <h1 class="display-6">Modificar Producto</h1>
                </small>
            </div>
            <div class="bg-light text-center" style="margin:0 auto;">
                <figure>
                    <img class="rounded float-end" src="https://image.flaticon.com/icons/png/512/3132/3132758.png"
                         style="height: 168px; width: 169px;">
                </figure>
                <div class="text-success form-floating" style=" position:relative;">
                    <form id="form" method="POST">

                        <label for="name">Nombre del Producto:</label>
                        <input style="width: 500px ; height: 35px;" type="text" name="nombre" id="name"
                               class="form-control text-center">

                        <br>
                        <label for="">Cantidad de Unidades:</label>
                        <input style="width: 500px ; height: 35px;" type="number" name="cantUnidad" id="cantUnidad"
                               class="form-control text-center">
                        <br>
                        <label for="">Marca:</label>
                        <input style="width: 500px ; height: 35px;" type="text" name="marca" id="marca"
                               class="form-control text-center" minlength="4" maxlength="8">
                        <br>

                        <label for="" class="form-label">Categoría:</label>
                        <input style="width: 500px ; height: 35px;" type="text" class="form-control text-center"
                               id="categoria" name="categoria" aria-describedby="emailHelp">
                        <br>

                        <label for="" class="form-label">Precio de Menudeo:</label><br>
                        <input style="width: 150px ; height: 35px;" type="text" class=" text-center"
                               id="precioMenudeo" name="precioMenudeo" placeholder="$0.00">
                        <br>
                        <label for="" class="form-label">Precio de Mayoreo:</label><br>
                        <input style="width: 150px ; height: 35px;" type="text" class=" text-center"
                               id="precioMayoreo" name="precioMayoreo" placeholder="$0.00">
                        <br>

                        <label for="">Fecha de Caducidad:</label><br>
                        <input class="text-center" type="date" name="fechaCaduc" name="fechaCaduc" readonly>
                        <br>

                        <label for="">Número de Lote:</label>
                        <input style="width: 500px ; height: 35px;" type="number" name="numLote" id="numLote"
                               class="form-control text-center">
                        <button type="submit" class="btn btn-warning text-center">Modificar Producto</button>
                        <br><br>
                    </form>
                </div>
            </div>
        </div>

    </article>
</section>

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