<%-- 
    Document   : product
    Created on : 13-Dec-2022, 08:36:52
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/product.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <title>Document</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="product-shop__main">
            <div class="product-shop__body-cart">
                <div class="container product-shop__body">
                    <div class="row">
                        <div class="col-6">
                            <div class="product-shop__img">
                                <c:set value="${requestScope.product}" var="product"/>
                                <div id="product-carousel" class="product-shop__img-body carousel slide" data-ride="carousel">
                                    <div  class="product-shop__img-detail carousel-inner bg-light">
                                        <div class="carousel-item active">
                                            <img src="assets/image/products-items/${product.getImage()}" alt="">
                                        </div>
                                        <c:forEach items="${requestScope.img}" var="i">
                                            <div class="carousel-item">
                                                <img src="assets/image/products-items/subimg/${i.img}" alt="">
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <a href="#product-carousel" class="carousel-control-prev" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a href="#product-carousel" class="carousel-control-next" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="product-shop-info">
                                <div class="product-shop-info__body">
                                    <div class="product-info__detail">
                                        <div class="product-info__name">
                                            <h4>${product.getName()}</h4>
                                        </div>
                                        <div class="product-info__price">
                                            <p class="product-info__price-code"><f:formatNumber type="number" value="${product.getPrice()*0.8}"/> with code</p>
                                            <p class="product-info__price-regular">Regular: £${product.getPrice()}</p>
                                            <c:if test="${account.role==2}">
                                            <a href="updateproduct?pid=${product.getId()}" >Update</a>  <a href="" >Delete</a>
                                            </c:if>
                                        </div>
                                        <div class="product-info__size">
                                            <div class="product-info__size-body">
                                                <div class="product-info__size-table">
                                                    <div class="product-info__size-title">
                                                        <Span class="product-info__size">Size: ${requestScope.size}</Span>
                                                        <!-- button trigger modal -->
                                                        <span class="product-info__size-chart">
                                                            <a type="button" class="btn" data-toggle="modal" data-target="#exampleModalLong">
                                                                SIZE CHART
                                                            </a>
                                                        </span>
                                                        <!-- modal -->
                                                        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                                            <div style="max-width: 700px;" class="modal-dialog" role="document">
                                                                <div class="modal-content ">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">ADIDAS SIZE CHARTS</h5>
                                                                        <button  type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body ">
                                                                        <div class="size-chart__logo">
                                                                            <div class="size-chart__logo-img">
                                                                                <img src="assets/image/slide/Adidas_Logo.svg.png" alt="" >
                                                                            </div>
                                                                        </div>
                                                                        <div class="size-chart__title">
                                                                            <span>ADIDAS CLOTHING</span>
                                                                        </div>
                                                                        <div class="size-chart__table">
                                                                            <div class="size-chart__table-body">
                                                                                <table class="table">
                                                                                    <thead class="thead-dark">
                                                                                    <th class="col">MEN</th>
                                                                                    <th class="col">XS</th>
                                                                                    <th class="col">S</th>
                                                                                    <th class="col">M</th>
                                                                                    <th class="col">L</th>
                                                                                    <th class="col">XL</th>
                                                                                    <th class="col">XXL</th>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>CHEST (IN)</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CHEST (IN)</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CHEST (IN)</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CHEST (IN)</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CHEST (IN)</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CHEST (IN)</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                            <td>31"-33"</td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <form action="buy" method="post" id="f">
                                                        <input type="hidden" name="pid" value="${product.getId()}"/>
                                                        <input type="hidden" name="size" value="${size}"/>
                                                        <div class="product-info__size-options">
                                                            <div class="product-info__size-option">
                                                                <ul class="product-info__size-option-list">
                                                                    <c:forEach items="${requestScope.sizes}" var="s">
                                                                        <li class="product-info__size-option-items ${s.quantity==0?"product-info__size-option-items--disable":""} ${size==s.name?"product-info__size-option-items--active":""} ">
                                                                            <a class="${size==s.name?"product-info__size-option-items--active":""}" <c:if test="${s.quantity!=0}">href="product?pid=${product.getId()}&size=${s.name}"</c:if> >${s.name}</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="product-info__size-submit">
                                                            <div class="product-info__size-submit-body">
                                                                <div class="size-submit__quantity-body">
                                                                    <div class="size-submit__quantity">
                                                                        <div class="size-submit__quantity-title"><span>Quantity</span></div>
                                                                        <input class="size-submit__quantity-input" type="number" name="quantityBuy" value="1">
                                                                    </div>
                                                                </div>
                                                                <div class="size-submit__btn">
                                                                    <div class="size-submit__customer">
                                                                        <button class="size-submit__customer-btn">Customer</button>
                                                                    </div>
                                                                    <div class="size-submit__add-cart">
                                                                        <button class="size-submit__add-cart-btn" onclick="buy('${requestScope.pid}')">Add to Cart</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-info__more">
                                            <a href="#ship" data-toggle="collapse" aria-expanded="false" aria-controls="ship">
                                                <div class="product-info__ship">
                                                    ship
                                                    <i class="fa-solid fa-plus"></i>
                                                    <div class="product-info__describe collapse" id="ship">
                                                        akljfd lakfjalkjfkl adsjflkadsj flskjdfl
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#detail" data-toggle="collapse" aria-expanded="false" aria-controls="detail">
                                                <div class="product-info__ship">
                                                    Detail
                                                    <i class="fa-solid fa-plus"></i>
                                                    <div class="product-info__describe collapse" id="detail">
                                                        akljfd lakfjalkjfkl adsjflkadsj flskjdfl
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#describle" data-toggle="collapse" aria-expanded="false" aria-controls="describle">
                                                <div class="product-info__ship">
                                                    Description
                                                    <i class="fa-solid fa-plus"></i>
                                                    <div class="product-info__describe collapse" id="describle">
                                                        akljfd lakfjalkjfkl adsjflkadsj flskjdfl
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>

                </div>
            </div>
            <div class="product-shop__body-viewed">
                <div class="product-shop__title">
                    <h4>Recently Viewed</h4>
                </div>
                <div class="product-shop__body-view">
                    <div class="product-shop__viewed row">
                        <ul class="product-shop__viewed-list">
                            <li class="product-shop__viewed-items">
                                <a href="">
                                    <div class="product-shop__img">
                                        <div class="product-shop__img-body">
                                            <img class="img-thumbnail" src="./assets/image/products-items/away_gk1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="product-shop__description">
                                        <p class="product-shop__description-price-code">1$ with code</p>
                                        <p class="product-shop__description-price-regular">Regular: 12$</p>
                                        <p class="product-shop__description-detail">Manchester United Home Shirt 2022-23</p>
                                    </div>
                                </a>
                            </li>
                            <li class="product-shop__viewed-items">
                                <a href="">
                                    <div class="product-shop__img">
                                        <div class="product-shop__img-body">
                                            <img class="img-thumbnail" src="./assets/image/products-items/away_gk1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="product-shop__description">
                                        <p class="product-shop__description-price-code">1$ with code</p>
                                        <p class="product-shop__description-price-regular">Regular: 12$</p>
                                        <p class="product-shop__description-detail">Manchester United Home Shirt 2022-23</p>
                                    </div>
                                </a>
                            </li>
                            <li class="product-shop__viewed-items">
                                <a href="">
                                    <div class="product-shop__img">
                                        <div class="product-shop__img-body">
                                            <img class="img-thumbnail" src="./assets/image/products-items/away_gk1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="product-shop__description">
                                        <p class="product-shop__description-price-code">1$ with code</p>
                                        <p class="product-shop__description-price-regular">Regular: 12$</p>
                                        <p class="product-shop__description-detail">Manchester United Home Shirt 2022-23</p>
                                    </div>
                                </a>
                            </li>
                            <li class="product-shop__viewed-items">
                                <a href="">
                                    <div class="product-shop__img">
                                        <div class="product-shop__img-body">
                                            <img class="img-thumbnail" src="./assets/image/products-items/away_gk1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="product-shop__description">
                                        <p class="product-shop__description-price-code">1$ with code</p>
                                        <p class="product-shop__description-price-regular">Regular: 12$</p>
                                        <p class="product-shop__description-detail">Manchester United Home Shirt 2022-23</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp"%>

        <script type="text/javascript">
            function buy(id) {
                var quantity = document.f.quantityBuy.value;
                var size = document.f.size.value;
                document.f.submit();
            }
        </script>
    </body>
</html>
