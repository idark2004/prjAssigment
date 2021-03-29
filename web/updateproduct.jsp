<%-- 
    Document   : updateproduct
    Created on : Mar 16, 2021, 11:09:18 PM
    Author     : phath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product</title>
    </head>
    <body>
        <h1>Let's Update!!!</h1>
        <form action="MainController">
            <label for="category">Category</label>
            <select name="categoryID" id="category">
                <option value="PS">PlayStation</option>
                <option value="PC">Personal Computer</option>
                <option value="NI">Nintendo</option>
            </select></br>
            <label for="ID">Product ID</label>
            <input type="text" name="productID" id="ID" placeholder="Category-XXX"
                   pattern="(PS|PC|NI)-[0-9]{3}" title="Category-XXX" value="${param.productID}" readonly="true"/></br>
            <div>${requestScope.PRODUCT_ERROR.productIDError}</div>
            <label for="name" >Name</label>
            <input type="text" name="productName" id="name" maxlength="40" value="${param.productName}"/></br>
            <label for="quantity">Quantity</label>
            <input type="number" name="productQuantity" id="quantity" min="0" value="${param.productQuantity}"/></br>
            <label for="price">Price($)</label>
            <input type="number" step="0.01" name="productPrice" id="price" min="0" title="US Dollars" value="${param.productPrice}"/></br>
            <input type="hidden" name="roleID" value="${sessionScope.LOGIN_USER.roleID}"/>
            <input type="submit" name="action" value="Confirm"/>
            <input type="reset" value="Reset"/>
    </body>
</html>
