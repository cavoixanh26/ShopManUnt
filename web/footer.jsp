<%-- 
    Document   : footer
    Created on : 10-Dec-2022, 20:41:34
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="footer">
        <div class="footer-home container-fluid">
            <div class="row footer-main">
                <div class="col-3 footer-info">
                    <h5 class="footer__service">Customer Service</h5>
                    <a href="" class="footer-info-link">Help</a>
                    <a href="" class="footer-info-link">Track Order</a>
                    <a href="" class="footer-info-link">Size Chart</a>
                </div>
                <div class="col-3 footer-info">
                    <h5 class="footer__service">Worry Free Shopping</h5>
                    <a href="" class="footer-info-link">Safe Shopping</a>
                    <a href="" class="footer-info-link">Delivery & Shipping</a>
                    <a href="" class="footer-info-link">90-Day Returns</a>
                </div>
                <div class="col-3 footer-info">
                    <h5 class="footer__service">Information</h5>
                    <a href="" class="footer-info-link">My Account</a>
                    <a href="" class="footer-info-link">About Us</a>
                    <a href="" class="footer-info-link">Affiliate Program</a>
                </div>
                <div class="col-3">
                    <c:if test="${sessionScope.account == null}">
                        <a href="register.jsp" class="btn-sign-up">SIGN UP & SAVE 10%</a>
                    </c:if>
                    <div class="internet-media">
                        <p>Follow Us</p>
                        <div class="icon-media">
                            <a href="" class="icon-media-link">
                                <i class="fa-brands fa-youtube"></i>
                            </a>
                            <a href="" class="icon-media-link">
                                <i class="fa-brands fa-facebook"></i>
                            </a>
                            <a href="" class="icon-media-link">
                                <i class="fa-brands fa-tiktok"></i>
                            </a>
                            <a href="" class="icon-media-link">
                                <i class="fa-brands fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
