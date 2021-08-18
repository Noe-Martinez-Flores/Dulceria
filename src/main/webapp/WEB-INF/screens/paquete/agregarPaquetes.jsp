<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 13/08/2021
  Time: 07:44 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Registrar Paquetes</title>
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
                <a class="nav-link active text-white"
                   href="<%=context%>/ServletInicioAdmin">Principal<span
                        class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletConsultaPersonal">Consultar
                    Productos</a>
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
                <img src="<%=context%>/assets/calAzuc.png" width="30" height="30"
                     class="d-inline-block align-top" alt="">
                <span class="textTitle"> La calaverita de azúcar</span>
            </a>
        </nav>
    </div>
</header>

<section style="margin-top: 4rem;" class="container-fluid  ">


    <a class="btn-outline-success" href="<%=context%>/ServletToPaquetes"> consultar paquetes </a>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="producto" role="tabpanel" aria-labelledby="home-tab">
            <div class="card">

            </div>
        </div>
    </div>
</section>

<section>
    <article>
        <div class="container-fluid">
            <div class="">
                <div class="card-header text-center ">
                    <small class="">
                        <h1 class="display-6">Registro de Paquetes</h1>
                    </small>
                </div>
                <br>
                <div class=" text-center " style="margin:0 auto;">
                    <figure >
                        <img class="rounded float-end "
                             src="https://image.flaticon.com/icons/png/512/1074/1074562.png"
                             style="height: 168px; width: 169px;">
                    </figure>
                    <div class=" form-floating" style=" position:relative; color: #2C0348;">

                        <form action="<%=context%>/ServletCrearPaquetes" id="form" method="post">

                            <div class="row text-center ">
                                <div class="col-12 col-sm-4">
                                    <label for="namePaquete">Nombre del Paquete:</label>
                                    <input style="width: 100% ; height: 35px;" type="text" name="namePaquete"
                                           id="namePaquete" class="form-control text-center">
                                </div>
                                <div class="col-12 col-sm-4">
                                    <label for="cantidadPaquetes">Cantidad de paquetes:</label>
                                    <input style="width: 100% ; height: 35px;" type="number"
                                           name="cantidadPaquetes" id="cantidadPaquetes" class="form-control text-center"
                                           minlength="4" maxlength="8">
                                </div>

                                <div class="col-12 col-sm-4">
                                    <label for="precioPaquete"
                                     class="form-label">Precio del paquete</label>
                                    <input style="width: 100% ; height: 35px;" type="number"
                                           class="form-control text-center" name="precioPaquete" id="precioPaquete"  step="0.01">
                                </div>
                                <br>
                                <br>
                                <br>
                                <div class="col-12 col-sm-12 text-center ">
                                    <button type="submit" class="btn btn-primary text-center size-font-button"> Registrar Paquete </button>
                                </div>
                            </div>



                        </form>
                        <c:if test="${message == 'succesInsertProducto'}">
                            <div class="row">
                                <div class="col-12">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        !Producto registrado con exito!
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>


    </article>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous">
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
