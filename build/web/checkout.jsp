<%-- 
    Document   : checkout
    Created on : 17-Dec-2022, 14:20:41
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
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 439px;
            }

            .ship{
                width: 60%;
            }

            .ship-body {
                width: 100%;
            }

            .ship-account p {
                font-size: 20px;
            }

            .ship-account a {
                color: blue;
            }

            .ship-address__title p {
                font-size: 18px;
                font-weight: 600;
            }

            input, select{
                height: 40px;
                border-radius: 5px;
                margin-bottom: 8px !important;
                padding: 0 6px;
                border: 2px solid;
                outline-color: rgb(26, 137, 206);
            }

            .active--dangerous {
                outline-color: #db1d24;
                color: #db1d24;
            }

            input:nth-child(1){
                margin-right: 10px;
            }

            .ship-address__input-name input {
                width: calc(50% - 8px);
            }

            .ship-address__input-email-phone input:nth-child(1) {
                width: 60%;
            }

            .ship-address__input-email-phone input:nth-child(2) {
                width: calc(40% - 16px);
            }

            .ship-address__input-adr input {
                width: calc(80% - 6px);
            }

            .ship-checkout {
                height: 45px;
                width: calc(100%);
                background-color: #000;
                border-radius: 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
            }

            .ship-checkout input,
            .ship-checkout i
            {
                color: #fff;
                background: none;
                border: none;
                margin: 0 !important;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <c:set value="${sessionScope.account}" var="account"/>
        <c:set value="${requestScope.cart}" var="cart"/>
        <div class="container">
            <div class="ship">
                <div class="ship-body">
                    <c:if test="${account==null}">
                        <div class="ship-account">
                            <p>Already have an account?
                                <a href="login">LOG IN</a> or <a href="">REGISTER</a>
                            </p>
                        </div>
                    </c:if>
                    <c:set value="${requestScope.customer}" var="cus"/>
                    <form action="checkout" method="post">
                        <div class="ship-address">
                            <div class="ship-address__title">
                                <p>Shipping Address</p>
                            </div>
                            <div class="ship-address__input">
                                <div class="ship-address__input-name">
                                    <input type="text" name="firstName" placeholder="First Name*" required="" value="${cus.firstName}">
                                    <input type="text" name="lastName" placeholder="Last Name*" required="" value="${cus.lastName}">
                                </div>
                                <div class="ship-address__input-email-phone">
                                    <input type="text" name="email" placeholder="Email*" required="" value="${cus.email}">
                                    <input type="text" name="phone" placeholder="Phone*" required="" value="${cus.phone}">
                                </div>
                                <div class="ship-address__input-adr">
                                    <input type="text" name="address" placeholder="Address*" required="" value="${cus.address}">
                                    <select name="typeCheckout" required="" style="min-width: 124px;">
                                        <c:if test="${account.amount >= cart.getTotalPrice()}">
                                            <option value="amount">Pay Amount</option>    
                                        </c:if>
                                        <option value="after">Pay After</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="ship-checkout">
                            <i class="fa-solid fa-lock"></i>
                            <input type="submit" value="Continue Checkout"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
