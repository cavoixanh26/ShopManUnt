<%-- 
    Document   : myCart
    Created on : 14-Dec-2022, 20:56:18
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            .line {
                border-bottom: 1px solid #ccc;
                height: 1px;
                width: 65%;
                margin-bottom: 20px;
            }

            .content-body {
                min-height: 445px;
                margin: 0 60px;
            }

            .pro-items {
                margin-bottom: 20px;
                border-bottom: 1px solid #ccc;
                padding-bottom: 20px;
            }

            .title {
                margin-bottom: 20px;
                position: relative;
            }

            .pro-list {
                list-style: none;
            }

            .product-img {
                height: 180px;
                width: 180px;
            }

            .product-img img {
                max-width: 100%;
            }

            .product-name {
                font-size: 14px;
            }

            .product-ship {
                font-size: 12px;
                color: #247e0c;
                margin-top: 16px;
            }

            .product-input input,
            .product-input select {
                font-weight: 400;
                height: 40px;
                width: 95px;
                padding: 4px 6px;
                border-radius: 5px;
                border: 1px solid;
                font-size: 21px;
                text-align: center;
                outline-color: #db1d24;
            }

            .product-price p {
                margin: 0;
                float: right;
            }

            .product-delete {
                margin-left: 20px;
                float: right;
            }

            .product-delete button {
                border: none;
                background: none;
                cursor: pointer;
            }

            .product-price p:first-child {
                color: #db1d24;
                font-weight: 400;
            }

            .checkout-container {
                border: 1px solid #ccc;
                padding: 10px;
            }

            .checkout-body {
                padding: 15px;
            }

            .checkout-title p {
                font-size: 18px;
                font-weight: 500;

            }

            .checkout-input input {
                height: 40px;
                padding: 0 6px;
                border-radius: 5px;
            }

            .checkout-input input:nth-child(1) {
                font-weight: 600;
            }

            .checkout-input input:nth-child(2) {
                color: #fff;
                background-color: #000;
                cursor: pointer;
                width: 96px;
            }

            .checkout-totalprice {
                margin-top: 10px;
                font-size: 18px;
                font-weight: 600;
                height: 50px;
                display: flex;
                justify-content: space-between;
            }

            .checkout-btn {
                height: 40x;
                width: 100%;
                border-radius: 5px;
                text-align: center;
                background-color: #000;
            }
            
            .checkout-btn:hover a, 
            .checkout-btn:hover,
            .checkout-input input:nth-child(2):hover 
            {
                color: #fff;
                background-color: #686868;
            }

            .checkout-btn a {
                color: #fff;
                padding: 10px 112px;
                line-height: 40px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container-fluid">
            <div class="content-body">
                <div class="body-main">
                    <div class="title">
                        <h4>Your Items</h4>
                    </div>
                    <div class="line"></div>
                    <div class="body-list-product row">
                        <div class="col-8">
                            <div class="list-product">
                                <c:set value="${requestScope.cart}" var="cart"/>

                                <ul class="pro-list">
                                    <c:forEach items="${cart.items}" var="i">
                                        <li class="pro-items">
                                            <div class="product">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <a href="">
                                                            <div class="product-img">
                                                                <img src="assets/image/products-items/${i.product.image}" alt="">
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="col-6">
                                                        <a href="">
                                                            <div class="product-name">
                                                                <p>${i.product.name}</p>
                                                            </div>
                                                        </a>
                                                        <jsp:useBean class="dal.DAO" id="dao"/>
                                                        <c:set value="${dao.getAllSize(i.product.id)}" var="s"/>
                                                        <div class="product-input">
                                                            <form action="modifyquantity" method="get">
                                                                <input type="hidden" name="pid" value="${i.product.id}"/>
                                                                <select name="size"  >
                                                                    <c:forEach items="${s}" var="s">
                                                                        <option onclick="this.form.submit()" value="${s.name}" ${i.size eq s.name ? "selected":""} >${s.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <input type="number" onclick="this.form.submit()" value="${i.quantity}" name="quantity">
                                                            </form>
                                                        </div>
                                                                <p style="color: red; font-size: 14px">${requestScope.full}</p>
                                                        <div class="product-ship">
                                                            <p>This item usually ships within one business day. Please allow
                                                                an extra 3 days for delivery of items with player or custom
                                                                name and number printing.</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-3" style="display: flex;">
                                                        <div class="product-price">
                                                            <p>£${i.product.price * i.quantity * 0.8} with code</p>
                                                            <p>Reg: £${i.product.price * i.quantity}</p>
                                                        </div>
                                                        <div class="product-delete">
                                                            <form action="modifyquantity" method="post">
                                                                <button onclick="this.form.submit()">
                                                                    <i class="fa-solid fa-x"></i>
                                                                </button>
                                                                <input type="hidden" name="pid" value="${i.product.id}"/>
                                                                <input type="hidden" name="size" value="${i.size}"/>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="col-4" style="padding: 40px;">
                            <div class="checkout-container">
                                <div class="checkout-body">
                                    <div class="checkout-title">
                                        <p>Have a Coupon ?</p>
                                    </div>
                                    <div class="checkout-input">
                                        <input type="text">
                                        <input type="submit" value="Apply">
                                    </div>
                                    <div class="checkout-totalprice">
                                        <p>Cart Total</p>
                                        <span style="color: #db1d24;">£${cart.getTotalPrice()}</span>
                                    </div>
                                    <div class="checkout-btn">
                                        <a href="checkout">
                                            <i class="fa-solid fa-lock"></i>
                                            Checkout
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
