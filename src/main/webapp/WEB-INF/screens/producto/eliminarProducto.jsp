<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 08/08/2021
  Time: 08:27 p. m.
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
    <title>Eliminar Producto</title>
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
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="producto" role="tabpanel" aria-labelledby="home-tab">
            <div class="card">
                <div class="card-body">
                    <h2>Productos</h2>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search"placeholder="Buscar"  aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i
                                data-feather="search"></i></button>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio Menudeo</th>
                        <th scope="col">Precio Mayoreo</th>
                        <th scope="col">Fecha de Caducidad</th>
                        <td class="text-center">Eliminar</td>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                    <tr>
                        <th scope="row">1</th>
                        <td>-----</td>
                        <td>$ 0.00</td>
                        <td>$ 0.00</td>
                        <td>-----</td>
                        <td><button onclick="return confirm('¿Estás seguro de eliminar este registro?')"
                                    title="Eliminar" class="btn btn-danger"><i
                                data-feather="trash"></i></button></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>-----</td>
                        <td>$ 0.00</td>
                        <td>$ 0.00</td>
                        <td>-----</td>
                        <td><button onclick="return confirm('¿Estás seguro de eliminar este registro?')"
                                    title="Eliminar" class="btn btn-danger"><i
                                data-feather="trash"></i></button></td>

                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>-----</td>
                        <td>$ 0.00</td>
                        <td>$ 0.00</td>
                        <td>-----</td>
                        <td><button onclick="return confirm('¿Estás seguro de eliminar este registro?')"
                                    title="Eliminar" class="btn btn-danger"><i
                                data-feather="trash"></i></button></td>
                    </tr>
                    </tbody>
                </table>
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
