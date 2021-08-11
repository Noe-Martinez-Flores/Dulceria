<%--
  Created by IntelliJ IDEA.
  User: noemt
  Date: 20/07/2021
  Time: 05:31 p. m.
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
<div class="text-center ">
    <h1 class="textTitle">Recuperación

    </h1>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-12 col-md-3 text-center " >
            <img  width="70%" src="<%=context%>/assets/calAzuc.png" alt="">
        </div>
        <div class="col-12 col-md-6 " >
            <section id=" login">
                <div style="margin-bottom: 2rem;"class="card">
                    <div class="card-body">

                        <form class="px-4 py-3" method="post">

                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="UsuarioRecup">Codigo de verificacion:</label>
                                <div class="col-sm-9"><input type="number" class="form-control" id="UsuarioRecup" placeholder="UserUTEZ">
                                </div>

                            </div>

                            <div class="text-center">
                                <a href="<%=context%>/ServletNuevaContraseña" type="submit" class="btn btn-primary" ><h4>verificar</h4> </a>
                            </div>
                        </form>


                    </div>
                </div>
            </section>
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