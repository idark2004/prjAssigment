<%-- 
    Document   : addNewProduct
    Created on : Mar 15, 2021, 10:57:47 PM
    Author     : phath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='CSS/viewStyle.css' rel='stylesheet' type="text/css"/>
        <title>Add product</title>
    </head>
    <body>
        <h1>Add a new product</h1>       
        <form action="MainController">
            <label for="category">Category</label>
            <select name="categoryID" id="category">
                <option value="PS">PlayStation</option>
                <option value="PC">Personal Computer</option>
                <option value="NI">Nintendo</option>
            </select></br>
            <label for="ID">Product ID</label>
            <input type="text" name="productID" id="ID" placeholder="Category-XXX"
                   pattern="(PS|PC|NI)-[0-9]{3}" title="Category-XXX"/></br>
            <div>${requestScope.PRODUCT_ERROR.productIDError}</div>
            <label for="name">Name</label>
            <input type="text" name="productName" id="name" maxlength="40"/></br>
            <label for="quantity">Quantity</label>
            <input type="number" name="productQuantity" id="quantity" min="0"/></br>
            <label for="price">Price($)</label>
            <input type="number" step="0.01" name="productPrice" id="price" min="0" title="US Dollars"/></br>                        
            <input type="submit" class="action" name="action" value="Add"/>
            <input type="reset" value="Reset"/>
        </form>
            <button onclick="JavaScript:window.location='fullcontrol.jsp'">Go back</button>
        <style>
            body,buton{
                text-align: center;
            }
            h1{
                padding-top: 10vh;
            }
            form{
                padding: 8vh;
            }
        </style>
    </body>
</html>
