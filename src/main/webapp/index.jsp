<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String context = request.getContextPath(); %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


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
    <title>Dulceria</title>
</head>

<body class="bodyBg" >
<style>
    @import url('http://fonts.cdnfonts.com/css/chicken-soup?styles=65478');
</style>

<header>
    <nav style="background-color: rgb(236,112,99);" class="navbar navbar-light  shadow">
        <a class="navbar-brand" href="#">
            <img src="<%=context%>/assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top"
                 alt="">
            <span class="textTitle text-white"> La calaverita de azúcar</span>
        </a>
    </nav>
</header>
<br>

<div class="text-center ">
    <h1 class="textTitle">¡Bienvenido! a la
        <br> "Dulcería La calaverita de azúcar"
    </h1>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-12 col-md-3 text-center " >
            <img  width="70%" src="<%=context%>/assets/calAzuc.png" alt="calavera">
        </div>
        <div class="col-12 col-md-6 " >
            <section id=" login">
                <div style="margin-bottom: 2rem;"class="card">
                    <div class="card-body">

                        <div>
                            <form action="<%=context%>/ServletLogin" class="px-4 py-3" method="post">

                                <div class="form-group row">
                                    <label class="col-sm-1 " for="UsuarioLogin" title="usuario"><i class="fas fa-user"></i></label>
                                    <div class="col-sm-11"><input type="text" class="form-control" name="usuarioLogin" id="usuarioLogin" placeholder="UserUTEZ">
                                    </div>

                                </div>
                                <br>
                                <div class="form-group row">
                                    <label class="col-sm-1 " for="PassLogin" title="password"><i class="fas fa-unlock-alt"></i></label>
                                    <div class="col-sm-11"><input type="password" class="form-control" name="passLogin" id="passLogin" placeholder="******">
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary size-font-button" >Iniciar Sesión  <i class="fas fa-sign-in-alt"></i> </button>
                                </div>
                                <div class="form-group text-center ">
                                    <div class="form-check">
                                        <a class="nav-link" href="<%=context%>/ServletRedirectEmailRecover"> ¿Olvidaste la contraseña?</a>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <c:if test="${message == 'fail'}">
                            <div class="row">
                                <div class="col-12">
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        Usuario y/o contraseña incorrectos
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>


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