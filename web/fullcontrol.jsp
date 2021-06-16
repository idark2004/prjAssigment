<%-- 
    Document   : fullControl
    Created on : Mar 16, 2021, 9:49:41 PM
    Author     : phath
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='CSS/viewStyle.css' rel='stylesheet' type="text/css"/>
        <title>Admin Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.LOGIN_USER.name}</h1>
        <form action="MainController">
            <input type="submit" class="action" name="action" value="Log Out"/>
        </form>
        <button onclick="JavaScript:window.location = 'addnewproduct.jsp'">Add new product</button>
        <form action="MainController">
            <label for="search">Product: </label>
            <input type="text" name="search" id="search" value="${param.search}"/>
            <select name="categoryID">
                <option value="PS">PlayStation</option>
                <option value="PC">Personal Computer</option>
                <option value="NI">Nintendo</option>
                <option value="">All</option>            
            </select>
            <select name="status">
                <option value="True">Available</option>
                <option value="False">Unavailable</option>
            </select>
            <input type="submit" class="action" name="action" value="Search"/>
            <input type="hidden" name="roleID" value="${sessionScope.LOGIN_USER.roleID}"/>
        </form>
        <c:if test="${requestScope.PRODUCT_LIST != null}">
            <table border="1" id="adminTable">
                <caption>Product table</caption>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Category ID</th>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" varStatus="counter" items="${requestScope.PRODUCT_LIST}">
                    <form action="MainController">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${product.categoryID}</td>
                            <td>${product.productID}</td>
                            <td>${product.productName}</td>
                            <td>${product.productPrice}</td>
                            <td>${product.productQuantity}</td>

                            <td>
                                <input type="submit" class="action" name="action" value="Update"/>
                                <input type="hidden" name="productID" value="${product.productID}"/>
                                <input type="hidden" name="productName" value="${product.productName}"/>
                                <input type="hidden" name="productPrice" value="${product.productPrice}"/>
                                <input type="hidden" name="productQuantity" value="${product.productQuantity}"/>
                                <input type="hidden" name="search" value="${param.search}"/>
                                <input type="hidden" name="categoryID" value="${param.categoryID}"/>
                                <input type="hidden" name="status" value="${param.status}"/>
                            </td>
                            <c:if test="${product.status == 1}">
                                <td>
                                    <c:url var="delete" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="productID" value="${product.productID}"></c:param>
                                        <c:param name="categoryID" value="${param.categoryID}"></c:param>
                                        <c:param name="status" value="${param.status}"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                        <c:param name="roleID" value="${sessionScope.LOGIN_USER.roleID}"></c:param>
                                    </c:url>
                                    <a href="${delete}" class="action">Delete</a>
                                </td>
                            </c:if>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <div>${requestScope.EMPTY_LIST.msg}</div>
</body>
</html>
