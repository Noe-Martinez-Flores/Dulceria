<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 20/07/2021
  Time: 05:31 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://unpkg.com/feather-icons"></script>
    <title>Restablecimiento</title>
</head>



<body class="bodyBg" >

<header>
    <nav style="background-color: rgb(236,112,99);" class="navbar navbar-light  shadow">
        <a class="navbar-brand" href="#">
            <img src="<%=context%>/assets/calAzuc.png" width="30" height="30" class="d-inline-block align-top"
                 alt="">
            <span class="textTitle text-white"> La calaverita de azúcar</span>
        </a>
    </nav>
</header>

<div class="container-fluid" style="  margin-top: 1rem;"><a href="<%=context%>/ServletBackToIndex">Regresar <i data-feather="log-in" ></i></a>
</div>
<div class="container-fluid">
<div class="m-0 vh-100 row justify-content-center align-items-center">
    <div class="card text-center">
        <div class="card-header">
            <h1 class="textTitle">Recuperación
                <h4>Ingresa su correo electronico</h4>
            </h1>
        </div>
        <div class="card-body">
            <img class="img-fluid" style="width: 75%; height: 200px; margin-bottom: 10px;" src="<%=context%>/assets/calAzuc.png">
            <form action="<%=context%>/ServletSendEmail" method="post">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Correo electrónico:*</label>
                            <input type="email" name="email" id="email" class="form-control" required>
                        </div>
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-outline-primary size-font-button"> Enviar </button>
                    </div>
                </div>
            </form>

        </div>
        <c:if test="${message=='notFoundEmail'}">
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        no existe el correo electronico en el sistema
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