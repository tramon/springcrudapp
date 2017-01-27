<%--
  Created by IntelliJ IDEA.
  User: tramo_000
  Date: 27.01.2017
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: tramo_000
  Date: 26.01.2017
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Products</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Products: ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>

    </c:if>

</div>

<br>
<br>
<table class="table-bordered" width="800" align="center">
    <tbody>
        <tr>
            <th>id</th><th>Manufacturer</th><th>Model</th><th>Description</th><th>Cost</th>
        </tr>
        <tr>
            <td>1</td><td>Brand</td><td>SomeModel</td><td>Best one!</td><td>10 000</td>
        </tr>



    </tbody>
</table>
<br>
<br>





<div class="container">
    Links:
    <ul type="circle">
        <li><a href="admin">Admin</a></li>
        <li><a href="edit">Edit</a></li>
        <li><a href="login">Login</a></li>
        <li><a href="products">Products</a></li>
        <li><a href="registration">Registration</a></li>
        <li><a href="welcome">Welcome</a></li>
    </ul>
</div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>