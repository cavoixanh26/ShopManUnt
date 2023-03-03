<%-- 
    Document   : login
    Created on : 12-Dec-2022, 16:12:54
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/login.css">

        <title>login</title>
    </head>
    <body>
        <div class="form-contain">
            <div class="form-main">
                <div class="form-input">
                    <form action="login" method="post">
                        <input type="text" name="username" placeholder="username">
                        <input type="password" name="password" placeholder="password">
                        <p class="noti">${noti}</p>
                        <input class="submit-btn" type="submit" value="LOGIN">
                    </form>
                </div>
                <div class="suggest-form">
                    <p>Not registered ? </p><a href="register">Create a new account</a>
                </div>
            </div>
        </div>
    </body>
</html>
