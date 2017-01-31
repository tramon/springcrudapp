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

    <title>Admin</title>

    <%--Add styles--%>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Admin Page ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
    </c:if>
</div>

<h4 align="center">This is an admin only page</h4>

<br>
<br>
<c:if test="${!empty listAdminProducts}">
    <table border="1" class="tg" align="center" width="800">
        <tr>
            <th width="15">ID</th>
            <th width="50">Brand</th>
            <th width="75">Model</th>
            <th width="30">Cost</th>
            <th width="200">Description</th>
            <th width="20">Edit</th>
            <th width="20">Delete</th>
        </tr>
        <c:forEach items="${listAdminProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.brand}</td>
                <td><a href="/product-info/${product.id}" target="_blank">${product.model}</a></td>
                <td>${product.cost}</td>
                <td>${product.description}</td>
                <td><a href="<c:url value='/edit/${product.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${product.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<br>


<c:url var="addAction" value="/products/add"/>
<form:form action="${addAction}">
    <table>
        <c:if test="${!empty admin.id}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        <%--moved from here--%>
            <tr>
                <td>
                    <form:label path="brand">
                        <spring:message text="brand"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="brand"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="model">
                        <spring:message text="model"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="model"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="cost">
                        <spring:message text="Cost"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="cost"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty admin.model}">
                        <input type="submit"
                               value="<spring:message text="Edit Product"/>"/>
                    </c:if>
                    <c:if test="${empty admin.model}">
                        <input type="submit"
                               value="<spring:message text="Add Product"/>"/>
                    </c:if>
                </td>
            </tr>
        </c:if> <%--Moved to here--%>
    </table>
</form:form>--%>

<br>
<br>

<div class="container">
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