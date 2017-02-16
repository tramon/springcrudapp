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
    <meta name="description" content="Admin page for editing products">
    <meta name="author" content="Tramon">

    <title>Admin</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Admin Page: ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
    </c:if>

</div>
<br>
<br>
<div class="container2">
    <c:url var="addAction" value="/admin/add"/>
    <form:form action="${addAction}" commandName="product">
        <table align="center">
            <c:if test="${product.id != 0}">
                <tr>
                    <td><form:label path="id"><spring:message text="ID"/></form:label></td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true" class="form-control"/>
                        <form:hidden path="id" class="form-control"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td><form:label path="brand"><spring:message text="Brand"/></form:label></td>
                <td><form:input path="brand" class="form-control"/></td>
            </tr>
            <tr></tr>

            <tr>
                <td><form:label path="model"><spring:message text="Model"/></form:label></td>
                <td><form:input path="model" class="form-control"/></td>
            </tr>
            <tr></tr>
            <tr>
                <td><form:label path="description"><spring:message text="Description "/></form:label></td>
                <td><form:input path="description" class="form-control"/></td>
            </tr>
            <tr></tr>

            <tr>
                <td><form:label path="cost"><spring:message text="Cost"/></form:label></td>
                <td><form:input path="cost" class="form-control"/></td>
            </tr>
            <tr>
            <tr></tr>
            <td colspan="2">
                <c:if test="${!empty product.model}">
                    <input type="submit" class="btn btn-lg btn-primary btn-block"
                           value="<spring:message text="Edit Product"/>"/>
                </c:if>
                <c:if test="${empty product.model}">
                    <input type="submit" class="btn btn-lg btn-primary btn-block"
                           value="<spring:message text="Add Product"/>"/>
                </c:if>
            </td>
        </table>
    </form:form>
</div>
<div>
    <c:if test="${!empty listProducts}">
        <table class="tg" width="700" border="0">
            <tr>
                <th width="15">ID</th>
                <th width="50">Brand</th>
                <th width="75">Model</th>
                <th width="30">Cost</th>
                <th width="150">Description</th>
                <th width="20">Edit</th>
                <th width="20">Delete</th>
            </tr>
            <c:forEach items="${listProducts}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.brand}</td>
                    <td><a href="/productdata/${product.id}" target="_blank">${product.model}</a></td>
                    <td>${product.cost}</td>
                    <td>${product.description}</td>
                    <td><a href="<c:url value='/edit/${product.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/remove/${product.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<br>
<div class="container2">
    <h4>Links:</h4>
    <ul type="circle">
        <li><a href="products">Products</a></li>
        <li><a href="registration">Register new user</a></li>
    </ul>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>