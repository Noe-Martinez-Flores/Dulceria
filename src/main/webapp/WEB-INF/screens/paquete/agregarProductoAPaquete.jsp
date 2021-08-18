<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 20/07/2021
  Time: 05:25 p. m.
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
            <a class="navbar-brand text-center">${sessionScope.user.rol.puesto}</a>
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


                <form method="post" action="<%=context%>/ServletProductosPaq">
                    <div class="row">
                        <div class="card-header col-6">
                            <label for="paquete" class="form-label">Seleccione el paquete al que le agregará los
                                productos</label>
                            <select name="paquete" id="paquete" class="form-control" required>
                                <option value="">Seleccione</option>
                                <c:forEach var="paquete" items="${listPaquete}">
                                    <option value="${paquete.id}">${paquete.nombrePaquete}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class=" card-header col-12 col-md-6">
                            <label for="productoPaq" class="form-label">Seleccione los productos</label>
                            <select name="productoPaq" id="productoPaq" class="form-control" required>
                                <option value="">Seleccione</option>
                                <c:forEach var="productoPaq" items="${listProductos}">
                                    <option value="${productoPaq.id}">${productoPaq.producto.nombreProducto}</option>
                                </c:forEach>
                            </select>


                        </div>
                        <div class="card-header col-12 text-center" >
                            <label for="cantidad" class="form-label">Seleccione cuantos productos</label>
                            <input type="number" name="cantidad" id="cantidad" class="form-control" required >

                        </div>

                        <div class="card-header col-12 text-center">
                            <button
                                    class="btn btn-success my-2 my-sm-0 size-font-button" style="margin: right 3rem;"
                                    type="submit"> Agregar <i class="fas fa-plus"></i></button>
                        </div>
                    </div>
                </form>


                <div class="card-body">

                    <br>


                </div>
            </div>

        </div>
    </div>
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
