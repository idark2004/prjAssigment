<%-- 
    Document   : signUp
    Created on : Mar 15, 2021, 6:24:30 PM
    Author     : phath
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='CSS/style.css' rel='stylesheet' type="text/css"/>                                
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src="JS/Effect.js"></script>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container">
            <div class="frame">
                <div class="nav">
                    <ul class="links">
                        <li class="signin-inactive"><a href="login.jsp" class="btn">Sign in</a></li>
                        <li class="signup-active"><a href="signup.jsp" class="btn">Sign up </a></li>
                    </ul>
                </div>
                <div ng-app ng-init="checked = false">
                    <form class="form-signin" action="MainController" method="POST" name="form">
                        <label for="name">Name</label>
                        <input class="form-styling" type="text" name="name" id="name" maxlength="50" required/></br>
                        <label for="userID">Email</label>
                        <input class="form-styling" type="email" name="userID" id="userID" title="${requestScope.USER_ERROR.userIDError}" required/></br>
                        <c:if test="${requestScope.USER_ERROR !=null}">
                            <c:if test="${not empty requestScope.USER_ERROR}">
                                <div class="alert alert-danger alert-dismissible fade show">
                                    <strong>${requestScope.USER_ERROR.userIDError}</strong> 
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                        </c:if>
                        <label for="password">Password</label>
                        <input class="form-styling" type="password" minlength="4" maxlength="10" name="password" id="password" placeholder="4-10 characters" required/></br>
                        <input class="btn-signup" type="submit" name="action" value="Sign Up"/>                                                
                    </form>
                    <button onclick="JavaScript:window.location = 'index.html'">Go Back</button>
                </div>
            </div>
        </div>
        <style>
            button{
                margin-top: 5%;
                background-color: #1059FF;
            }
        </style>
    </body>
</html>
