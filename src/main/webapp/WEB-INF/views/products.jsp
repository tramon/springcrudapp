<%--
  Created by IntelliJ IDEA.
  User: tramon
  Date: 26.01.2017
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<c:if test="${!empty listProducts}">
    <table class="tg" align="center" width="800">
        <tr>
            <th width="15">ID</th>
            <th width="50">Brand</th>
            <th width="75">Model</th>
            <th width="30">Cost</th>
            <th width="255">Description</th>
        </tr>
        <c:forEach items="${listProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.brand}</td>
                <td><a href="/productdata/${product.id}" target="_blank">${product.model}</a></td>
                <td>${product.cost}</td>
                <td>${product.description}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<br>
<div class="container">
    <h4>Links:</h4>
    <ul type="circle">
        <li><a href="admin">Admin</a></li>
        <li><a href="registration">Register new user</a></li>
    </ul>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>