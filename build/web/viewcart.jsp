<%-- 
    Document   : viewcart
    Created on : Mar 17, 2021, 3:33:41 AM
    Author     : phath
--%>

<%@page import="asg.dtos.ProductDTO"%>
<%@page import="asg.dtos.CartDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='CSS/viewStyle.css' rel='stylesheet' type="text/css"/>        
        <title>View Cart</title>
    </head>
    <body>
        <h1>This is your cart :</h1>
        <%
            float total = 0.0f;
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
                int count = 1;
                for (ProductDTO product : cart.getCart().values()) {
                    total += Float.parseFloat(product.getProductPrice()) * Integer.parseInt(product.getProductQuantity());
            %>
            <tbody>
            <form action="CartMainController">

                <tr>
                    <td><%= count++%></td>
                    <td><%= product.getProductName()%></td>
                    <td><%= product.getProductPrice()%></td>
                    <td><input type="number" name="productQuantity" min="1" value="<%= product.getProductQuantity()%>"/></td>
                    <td><%=Float.parseFloat(product.getProductPrice()) * Integer.parseInt(product.getProductQuantity())%></td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Delete"/>
                        <input type="hidden" name="productID" value="<%=product.getCategoryID()%>"/>
                    </td>
                </tr>

            </form>
            <%
                }
            %>
        </tbody>
    </form>                   
</table>
<%
    }
%>
<div>Total: <%= total%></div>
<c:url var="addMore" value="CartMainController">
    <c:param name="action" value="Add More"></c:param>
</c:url>
<a href="${addMore}">Add More</a>
</body>
</html>
