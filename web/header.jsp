<%-- 
    Document   : header
    Created on : 10-Dec-2022, 20:31:33
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <title>Document</title>
        <link rel="stylesheet" href="./assets/css/main.css">
    </head>
    <body>
        <div class="header">
            <div class="row">
                <div class="col-8 header__logo-search">
                    <a href="home" class="header__logo-link">
                        <img src="assets/image/logo.svg" alt="logo" class="header__logo-link-img">
                    </a>
                    <div class="header__search-input">
                        <form action="search" method="get">
                            <input type="text" placeholder="Search" name="query">
                            <button class="icon-search" onclick="this.form.submit()"><i class="fa-solid fa-magnifying-glass"></i></button>    
                        </form>
                    </div>
                </div>
                <c:set value="${sessionScope.account}" var="account"/>
                <div class="col-4 header__user-cart">
                    <div class="user-cart">
                        <div class="header__user">
                            <c:if test="${account!=null and account.role==3}">
                                <span style="color: #fff;
                                      margin-right: 20px;
                                      font-size: 20px; display: block">
                                    My Amount: £${account.amount}
                                </span>
                            </c:if>
                            <c:set value="${requestScope.cartPrice}" var="c"/>
                            <c:if test="${c!=null and account.role==3}">
                                <span style="color: #fff;
                                      margin-right: 20px;
                                      font-size: 20px; display: block">Total Price: £${c.getTotalPrice()}</span>
                            </c:if>
                        </div>
                        <div class="header__user">
                            <c:if test="${account==null}">
                                <a href="login">login</a>
                            </c:if>
                            <c:if test="${account!=null}">
                                <div class="header__user-icon">
                                    <i class="fa-solid fa-user user__icon"></i>
                                    <div class="user__option">
                                        <ul class="user__option-list">
                                            <li class="user__option-selects"><a class="user__option-link" href="profile.jsp">Profile</a></li>
                                                <c:if test="${account.role==3}">
                                                <li class="user__option-selects"><a class="user__option-link" href="order_history.jsp">Order History</a></li>
                                                </c:if>
                                            <li class="user__option-selects"><a class="user__option-link" href="logout">Sign out</a></li>
                                                <c:if test="${account.role==2}">
                                                <li class="user__option-selects"><a class="user__option-link" href="statistic">Statistic</a></li>
                                                <li class="user__option-selects"><a class="user__option-link" href="newproduct">Add New Product</a></li>
                                                <li class="user__option-selects"><a class="user__option-link" href="updateproduct">Update Product</a></li>
                                                </c:if>
                                                <c:if test="${account.role==1}">
                                                <li class="user__option-selects"><a class="user__option-link" href="">Add New Emp</a></li>
                                                <li class="user__option-selects"><a class="user__option-link" href="">Manage Emp</a></li>
                                                </c:if>
                                                
                                        </ul>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <c:if test="${account.role==3}">
                            <div class="header__cart">
                                <div class="header__cart-icon">
                                    <a href="myCart">
                                        <i class="fa-solid fa-cart-shopping"></i>
                                        <span class="cart-icon-num">${requestScope.sizeCart}</span>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
