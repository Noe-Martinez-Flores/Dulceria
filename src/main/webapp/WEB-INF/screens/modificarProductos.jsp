<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 20/07/2021
  Time: 05:29 p. m.
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
    <link rel="shortcut icon" href="<%=context%>/assets/calAzuc.png" type="image/x-icon">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="http://fonts.cdnfonts.com/css/chicken-soup" rel="stylesheet">
    <title>Modificar</title>
</head>
<body>
<header>
    <div class="fixed-top">
        <div class="collapse" id="navbarToggleExternalContent">

            <div class="bg-danger p-4">
                <h5 class="text-white h4">Administrador</h5>
                <a class="nav-link active text-white" href="<%=context%>/index.html">Home <span class="sr-only">(current)</span></a>
                <a class="nav-link text-white" href="#">Features</a>
                <a class="nav-link text-white" href="#">Pricing</a>
                <a class="nav-link text-white" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
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

<div  style="margin-top: 4rem;"><a href="<%=context%>/adminInicio.html">Consultas</a><span>/ Modificar</span></div>

<form>
    <div class="row">
        <div class="col text-center">
            <label class="" for="">Nombre</label>
            <input type="text" class="form-control" placeholder="First name">
        </div>
        <div class="col">
            <label class="" for="">Nombre</label>
            <input type="text" class="form-control" placeholder="Last name">
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col">
            <label class="" for="">Nombre</label>
            <input type="text" class="form-control" placeholder="First name">
        </div>
        <div class="col">
            <label class="" for="">Nombre</label>
            <input type="text" class="form-control" placeholder="Last name">
        </div>
    </div>
</form>
</body>
</html>
