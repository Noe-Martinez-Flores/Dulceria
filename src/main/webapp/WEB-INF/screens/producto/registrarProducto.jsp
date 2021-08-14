<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Registrar Producto</title>
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


    <a class="btn-outline-success" href="<%=context%>/ServletInicioAdmin"> consultar productos </a>
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
                        <h1 class="display-6">Registro de Productos</h1>
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

                        <form action="<%=context%>/ServletAgregarProducto" id="form" method="post">

                            <div class="row text-center ">
                                <div class="col-12 col-sm-4">
                                    <label for="nameProducto">Nombre del Producto:</label>
                                    <input style="width: 100% ; height: 35px;" type="text" name="nameProducto"
                                           id="nameProducto" class="form-control text-center">
                                </div>

                                <br>

                                <div class="col-12 col-sm-4">
                                    <label for="cantidadUnidades">Cantidad de Unidades:</label>
                                    <input style="width: 100% ; height: 35px;" type="number"
                                           name="cantidadUnidades" id="cantidadUnidades" class="form-control text-center"
                                            minlength="4" maxlength="8">
                                </div>

                                <br>

                                <div class="col-12 col-sm-4">
                                    <label for="marca" class="form-label">Marca:</label>
                                    <select name="marca" id="marca" class="form-control" required>
                                        <option value="">Seleccione</option>
                                        <c:forEach var="marca" items="${listMarcas}">
                                            <option value="${marca.id}">${marca.marcaProducto}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="row text-aling">
                                <br>

                                <div class="col-12 col-sm-4" >
                                    <label for="categoria" class="form-label">Categoria:</label>
                                    <select name="categoria" id="categoria" class="form-control" required>
                                        <option value="">Seleccione</option>
                                        <c:forEach var="categoria" items="${listCategorias}">
                                            <option value="${categoria.id}">${categoria.nombreCategoria}</option>
                                        </c:forEach>
                                    </select>
                                </div>


                                <br>

                                <div class="col-12 col-sm-4">
                                    <label for="precioMenudeo" class="form-label">Precio de Menudeo:</label>
                                    <input style="width: 100% ; height: 35px;" type="number"
                                           class="form-control text-center" name="precioMenudeo" id="precioMenudeo"  step="0.01">
                                </div>


                                <br>


                                <div class="col-12 col-sm-4 ">
                                    <label for="precioMayoreo" class="form-label">Precio de Mayoreo:</label><br>
                                    <input style="width: 100% ; height: 35px;" type="number"
                                           class="form-control text-center" name="precioMayoreo" id="precioMayoreo"  step="0.01">
                                </div>


                                <br>


                                <div class="col-12 col-sm-4 ">
                                    <label for="fechaCaducidad" class="form-label">Fecha de Caducidad:</label><br>
                                    <input style="width: 100% ; height: 35px;" type="date"
                                           class="form-control text-center" name="fechaCaducidad" id="fechaCaducidad"
                                           placeholder="**-**-****">
                                </div>


                                <br>

                                <div class="col-12 col-sm-4 ">
                                    <br>

                                    <button type="submit" class="btn btn-primary text-center size-font-button">Registrar Producto</button>
                                </div>


                                <br>


                                <div class="col-12 col-sm-4 ">
                                    <label for="numeroLote" class="form-label">Número de Lote:</label><br>
                                    <input style="width: 100% ; height: 35px;" type="number"
                                           class="form-control text-center" name="numeroLote" id="numeroLote">
                                </div>
                            </div>

                            <br>

                            <br>
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

