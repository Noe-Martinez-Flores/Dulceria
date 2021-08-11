<%-- Created by IntelliJ IDEA. User: noemt Date: 26/07/2021 Time: 08:01 p. m. To change this template use File |
    Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=context%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="shortcut icon" href="<%=context%>/assets/calAzuc.png" type="image/x-icon">
    <link rel="stylesheet"
          href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="http://fonts.cdnfonts.com/css/chicken-soup" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <title>Empleados</title>
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
                    Empleados</a>
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

    <h1>Bienvenido <span></span></h1>
    <a class="btn-outline-success" href="<%=context%>/ServletConsultaPersonal"> consultar empleados </a>
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
                    <small class="text-success">
                        <h1 class="display-6">Registro de Empleados</h1>
                    </small>
                </div>
                <div class=" text-center " style="margin:0 auto;">
                    <figure >
                        <img class="rounded float-end "
                             src="https://image.flaticon.com/icons/png/512/848/848006.png"
                             style="height: 168px; width: 169px;">
                    </figure>
                    <div class="text-success form-floating" style=" position:relative;">

                        <form action="<%=context%>/ServletCreatePersonal" id="form" method="post">

                            <div class="row text-center ">
                                <div class="col-12 col-sm-4">
                                    <label for="name">Nombre Completo:</label>
                                    <input style="width: 100% ; height: 35px;" type="text" name="name"
                                           id="name" class="form-control text-center"
                                           placeholder="example:Obed">
                                </div>

                                <br>

                                <div class="col-12 col-sm-4">
                                    <label for="username">Nombre de usuario:</label>
                                    <input style="width: 100% ; height: 35px;" type="text"
                                           name="username" id="username" class="form-control text-center"
                                           placeholder="example:Obed_Felz12" minlength="4" maxlength="8">
                                </div>

                                <br>

                                <div class="col-12 col-sm-4">
                                    <label for="email" class="form-label">Correo Electrónico:</label>
                                    <input style="width: 100% ; height: 35px;" type="email"
                                           class="form-control text-center" name="email" id="email"
                                           aria-describedby="emailHelp" placeholder="example@gmail.com">
                                </div>
                            </div>

                            <div class="row text-aling">
                                <br>

                                <div class="col-12 col-sm-4" >
                                    <label for="pass" class="form-label">Contraseña:</label>
                                    <input style="width: 100% ; height: 35px;" type="password"
                                           class="form-control text-center" name="pass" id="pass">
                                </div>


                                <br>

                                <div class="col-12 col-sm-4">
                                    <label for="pass" class="form-label">Confirmar Contraseña:</label>
                                    <input style="width: 100% ; height: 35px;" type="password"
                                           class="form-control text-center" name="pass" id="pass">
                                </div>


                                <br>


                                <div class="col-12 col-sm-4 ">
                                    <label for="number" class="form-label">Número de
                                        teléfono:</label><br>
                                    <input style="width: 100% ; height: 35px;" type="tel"
                                           class="form-control text-center" name="number" id="number"
                                           placeholder="000-000-000">
                                </div>

                            </div>

                            <br>
                            <br>
                            <button type="submit" class="btn btn-primary text-center">Registrar</button>
                            <br>
                        </form>
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