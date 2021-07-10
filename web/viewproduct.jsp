<%-- 
    Document   : viewProduct
    Created on : Mar 15, 2021, 10:37:24 PM
    Author     : phath
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
        <link href='CSS/viewStyle.css' rel='stylesheet' type="text/css"/>
        <title>View Products</title>
    </head>
    <body>        
        <div id="right">
            <form action="CartMainController">
                <input type="submit" class="action" name="action" id="cart" value="View Cart"/>
            </form>
        </div>
        <h1>Hello ${sessionScope.LOGIN_USER.name}${sessionScope.GOOGLE.name}</h1>
        <c:choose>
            <c:when test="${not empty sessionScope.LOGIN_USER && empty sessionScope.GOOGLE}">
                <form action="MainController">
                    <input type="submit" class="action" name="action" id="LogOut"value="Log Out"/>
                </form>
            </c:when>
            <c:when test="${empty sessionScope.LOGIN_USER && not empty sessionScope.GOOGLE}">
                <a href="index.html" onclick="signOut();">Sign out</a>
            </c:when>
            <c:otherwise>
                <button onclick="JavaScript:window.location = 'index.html'">Go back</button>
            </c:otherwise>
        </c:choose>        
        <form action="MainController">
            <input type="text" name="search" value="${param.search}"/>
            <select name="categoryID" id="category">
                <option value="PS">PlayStation</option>
                <option value="PC">Personal Computer</option>
                <option value="NI">Nintendo</option>
                <option value="">All</option>            
            </select>
            <input type="hidden" name="status" value="True"/>
            <input type="submit" class="action" name="action" value="Search"/>
            <input type="hidden" name="roleID" value="${sessionScope.LOGIN_USER.roleID}"/>
        </form>
        <c:if test="${requestScope.PRODUCT_LIST != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Add to cart</th>
                    </tr>
                </thead>
                <c:forEach var="product" varStatus="counter" items="${requestScope.PRODUCT_LIST}">
                    <form action="CartMainController">                    
                        <tbody>
                            <tr>
                                <td>${counter.count}</td>
                                <td>${product.productName}</td>
                                <td>${product.productPrice}</td>
                                <td><input type="number" min="1" name="productQuantity"/></td>
                                <td>                                   
                                    <input type="submit" class="action" name="action" value="Add to cart"/>
                                    <input type="hidden" name="productID" value="${product.productID}"/>
                                    <input type="hidden" name="productName" value="${product.productName}"/>
                                    <input type="hidden" name="productPrice" value="${product.productPrice}"/>
                                    <input type="hidden" name="categoryID" value="${product.categoryID}"/>
                                    <input type="hidden" name="baseQuantity" value="${product.productQuantity}"/>
                                    <input type="hidden" name="status" value="${product.status}"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
                                    <input type="hidden" name="roleID" value="${sessionScope.LOGIN_USER.roleID}"/>
                                </td>
                            </tr>
                        </tbody>
                    </form>
                </c:forEach>
            </table>
        </c:if>
        <div>${requestScope.EMPTY_LIST.msg}</div>
        <div>${requestScope.MESSAGE}</div>

        <script>
            function signOut() {
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    console.log('User signed out.');
                });
            }
        </script>
    </body>
</html>
