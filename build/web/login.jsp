<%-- 
    Document   : login
    Created on : Mar 15, 2021, 6:32:57 PM
    Author     : phath
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="1098663425798-cvfmojturbosbq71v392alkshvjgsm6u.apps.googleusercontent.com">
        <title>Login</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='CSS/style.css' rel='stylesheet' type="text/css"/>                                
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src="JS/Effect.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container">
            <div class="frame">
                <div class="nav">
                    <ul class="links">
                        <li class="signin-active"><a href="login.jsp" class="btn">Sign in</a></li>
                        <li class="signup-inactive"><a href="signup.jsp" class="btn">Sign up </a></li>
                    </ul>
                </div>
                <div ng-app ng-init="checked = false">
                    <form class="form-signin" action="MainController" method="POST" name="form">
                        <label for="userID">Email</label>
                        <input class="form-styling" type="email" name="userID" id="userID" placeholder="xxx@gmail.com" required/></br>
                        <label for="password">Password</label>
                        <input input class="form-styling" type="password" name="password" id="password" placeholder="password from 4-10 characters" required/></br>                        
                        <input class="btn-signin" type="submit" name="action" value="Login" />
                        <div class="g-signin2" data-onsuccess="onSignIn"></div>
                        <c:if test="${not empty requestScope.GOOGLE_ERROR}">
                            <div class="alert alert-danger alert-dismissible fade show">
                                <strong>${requestScope.GOOGLE_ERROR}</strong> 
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                            </div>
                        </c:if>
                    </form>
                    <button onclick="JavaScript:window.location='index.html'">Go Back</button>
                    <style>
                        button{
                            background-color: #1059FF;
                        }
                        
                    </style>
                </div>
            </div>
        </div>
        <script>
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                console.log('Name: ' + profile.getName());                
                console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                window.location.href = 'MainController?action=Google&name='+profile.getName()+'&email='+profile.getEmail()+'&id='+profile.getId();
            }
        </script>
    </body>
</html>
