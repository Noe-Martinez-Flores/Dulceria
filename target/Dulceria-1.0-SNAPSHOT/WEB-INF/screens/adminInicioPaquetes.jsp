<%--
  Created by IntelliJ IDEA.
  User: familia
  Date: 02/08/2021
  Time: 08:34 p. m.
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
    <div class="fixed-top">
        <div class="collapse" id="navbarToggleExternalContent">

            <div class="bg-danger p-4">
                <h5 class="text-white h3">Administrador</h5>
                <hr class="">
                <a class="nav-link active text-white" href="">Principal<span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="<%=context%>/ServletCajeroInicio">Gestion Empleados</a>
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
            <a class="nav-link " id="producto-tab" data-toggle="tab" href="#producto" role="tab"
               aria-controls="producto"
               aria-selected="true">Productos</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="marca-tab" data-toggle="tab" href="#marca"  role="tab" aria-controls="marca"
               aria-selected="false" >  Marcas  </a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="categoria-tab" data-toggle="tab" href="#categoria" role="tab"
               aria-controls="categoria"
               aria-selected="false">Categorias</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="paquete-tab" data-toggle="tab" href="#paquete" role="tab" aria-controls="paquete"
               aria-selected="false">Paquetes</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="producto" role="tabpanel" aria-labelledby="home-tab">
            <div class="card">
                <div class="card-body">

                    <br>
                    <table class="table">
                        <thead class="btn-danger">
                        <tr>

                            <th style="text-align: center" scope="col">Producto </th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="align-content-center">
                            <th style="text-align: center">
                                <a href="<%=context%>/ServletAgregarCategoria"
                                   class="btn btn-success my-2 my-sm-0" style="margin: right 3rem;"
                                   type="submit"> Agregar <i class="fas fa-plus"></i>  </a>

                                <a href="<%=context%>/ServletConsultarCategoria"
                                   class="btn btn-primary my-2 my-sm-0" style="margin: right 3rem;"
                                   type="submit"> Consultar <i class="fas fa-search"></i> </a>
                            </th>

                        </tr>
                        </tbody>
                    </table>
                    <!-- Button trigger modal -->


                </div>

            </div>
        </div>
        <div class="tab-pane fade" id="marca" role="tabpanel" aria-labelledby="profile-tab">
            <div class="card">
                <div class="card-body">

                    <br>
                    <table class="table table-hover">
                        <thead class="btn-danger">
                        <tr>

                            <th style="text-align: center" scope="col">Marca </th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="align-content-center">
                            <th style="text-align: center">
                                <a href="<%=context%>/ServletAgregarMarcas"
                                   class="btn btn-success my-2 my-sm-0" style="margin: right 3rem;"
                                   type="submit"> Agregar <i class="fas fa-plus"></i>  </a>

                                <a href="<%=context%>/ServletMarcasTable"
                                   class="btn btn-primary my-2 my-sm-0" style="margin: right 3rem;"
                                   type="submit"> Consultar <i class="fas fa-search"></i> </a>
                            </th>


                        </tr>
                        </tbody>

                    </table>

                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="categoria" role="tabpanel" aria-labelledby="contact-tab">
            <div class="card">
                <div class="card-body">

                    <br>
                    <table class="table">
                        <thead class="btn-danger">
                        <tr>
                            <th style="text-align: center" scope="col">Categoria</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="align-content-center">
                            <th style="text-align: center">
                                <a href="<%=context%>/ServletAgregarCategoria"
                                   class="btn btn-success my-2 my-sm-0" style="margin: right 3rem;"
                                   type="submit"> Agregar <i class="fas fa-plus"></i>  </a>

                                <a href="<%=context%>/ServletConsultarCategoria"
                                   class="btn btn-primary my-2 my-sm-0" style="margin: right 3rem;"
                                   type="submit"> Consultar <i class="fas fa-search"></i> </a>
                            </th>

                        </tr>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="paquete" role="tabpanel" aria-labelledby="contact-tab">
            <div class="card">
                <div class="card-body">
                    <h2>Consultar Paquetes</h2>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Candy" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                    <br>
                    <table class="table">
                        <thead class="btn-danger">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Paquete
                                <button class="btn btn-success my-2 my-sm-0" style="margin: right 3rem;" type="submit">
                                    Agregar
                                </button>
                            </th>
                            <th scope="col">Contenido</th>
                            <th scope="col">Existencia</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Bombones</td>
                            <td class="align-middle">
                                <button type="button" class="btn btn-outline-success" data-toggle="modal"
                                        data-target="#paqueteModal">
                                    Productos
                                </button>
                            </td>

                            <td>50</td>

                        </tr>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="productoModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tittle1">Detalles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <label class="text-center" value="">Nombre</label>
                <br>
                <img style="width: 150px;" src="<%=context%>/assets/bomb.jpg" alt="">

            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-warning">Modificar</button>
                <button type="button" class="btn btn-danger">Eliminar</button>

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal " id="marcaModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="">
        <div class="container">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tittle2">Productos asociados</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead class="bg-danger">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Nombre</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="align-middle">
                            <th class="align-middle" scope="row">1</th>
                            <td class="align-middle">
                                <img style="width: 150px;" src="<%=context%>/assets/bomb.jpg" alt="">
                            </td>
                            <td class="align-middle">Bombones</td>

                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Understood</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal " id="categoriaModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="container">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tittle3">Productos asociados</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead class="bg-danger">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Nombre</th>

                    </tr>
                    </thead>
                    <tbody>
                    <tr class="align-middle">
                        <th class="align-middle" scope="row">1</th>
                        <td class="align-middle">
                            <img style="width: 150px;" src="<%=context%>/assets/bomb.jpg" alt="">
                        </td>
                        <td class="align-middle">Bombones</td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Understood</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal " id="paqueteModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="container">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tittle4">Contenido</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <table class="table">
                    <thead class="bg-danger">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">fecha de caducidad</th>

                    </tr>
                    </thead>
                    <tbody>
                    <tr class="align-middle">
                        <th class="align-middle" scope="row">1</th>
                        <td class="align-middle">
                            <img style="width: 150px;" src="<%=context%>/assets/bomb.jpg" alt="">
                        </td>
                        <td class="align-middle">Bombones</td>
                        <td class="align-middle">07/10/2021</td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-warning">Modificar</button>
                <button type="button" class="btn btn-danger">Eliminar</button>

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
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
