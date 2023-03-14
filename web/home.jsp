<%-- 
    Document   : home
    Created on : 09-Dec-2022, 21:25:34
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
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
    
    <%@include file="header.jsp" %>

    <div class="slide_img">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="detailProduct?id=1">
                        <img src="./assets/image/slide/slide1.jpg" alt="">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="detailProduct?id=47">
                        <img src="./assets/image/slide/slide2.jpg" alt="">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="detailProduct?id=13">
                        <img src="./assets/image/slide/slide3.jpg" alt="">
                    </a>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
    <div class="container-fluid body__container">
        <div class="gird">
            <div class="row body-main">
                <div class="col-2">
                    <nav class="category">
                        <h3 class="category__title">
                            <i class="category__heading-icon fa-solid fa-list"></i>
                            Category
                        </h3>
                        <ul class="category-list">
                            <c:forEach items="${requestScope.category}" var="c">
                                <li class="category__item"><a href="category?idCategory=${c.id}" class="category__item-link">${c.name}</a></li>
                            </c:forEach>
                        </ul>
                    </nav>

                    <nav class="category">
                        <form action="search" method="get">
                            <h3 class="category__title">
                                <i class="category__heading-icon fa-solid fa-filter"></i>
                                Filter detail
                            </h3>

                            <ul class="category-list ">
                                <p class="category__detail-type">
                                    <a href="#type" data-toggle="collapse" aria-expanded="false" aria-controls="type">
                                        Kit Type 
                                        <div class="category__show-more">
                                            <i class="fa-solid fa-chevron-down"></i>
                                        </div>
                                    </a>
                                </p>
                                <div class="category__items collapse" id="type">
                                    <c:forEach items="${requestScope.type}" var="t">
                                        <li class="category__item ">
                                            <label>
                                                <input type="checkbox"  value="${t.name}" name="type"> ${t.name}
                                            </label>
                                        </li>
                                    </c:forEach>
                                </div>
                            </ul>
                            <ul class="category-list ">
                                <p class="category__detail-type">
                                    <a href="#brand" data-toggle="collapse" aria-expanded="false" aria-controls="brand">
                                        Brand
                                        <div class="category__show-more">
                                            <i class="fa-solid fa-chevron-down"></i>
                                        </div>
                                    </a>
                                </p>
                                <div class="category__items collapse" id="brand">
                                    <c:forEach items="${requestScope.brand}" var="b">
                                        <li class="category__item ">
                                            <label>
                                                <input type="checkbox" name="brand" value="${b.name}"> ${b.name}
                                            </label>
                                        </li>
                                    </c:forEach>
                                </div>
                            </ul>
                            <ul class="category-list ">
                                <a href="#color" data-toggle="collapse" aria-expanded="false", aria-controls="#color">
                                    <p class="category__detail-type">Color
                                        <div class="category__show-more">
                                            <i class="fa-solid fa-chevron-down"></i>
                                        </div>
                                    </p>
                                </a>
                                <div class="category__items collapse" id="color">
                                    <c:forEach items="${requestScope.color}" var="c">
                                        <li class="category__item ">
                                            <label>
                                                <input type="checkbox" value="${c.name}" name="color"> ${c.name}
                                            </label>
                                        </li>
                                    </c:forEach>
                                </div>
                            </ul>

                            <ul class="category-list ">
                                <p class="category__detail-type">Khoảng giá</p>
                                <li class="category__item price-filter">
                                    <input type="text" name="priceFrom" placeholder="from">
                                    <span>-</span>
                                    <input type="text" name="priceTo" placeholder="to">
                                </li>
                            </ul>

                            <input type="submit" value="Submit" class="btn-submit-search-detail">
                        </form>
                    </nav>
                </div>

                <div class="col-10">
                    <div class="row">
                        <div class="home-sort-bar">
                            <span class="home-sort-bar__label">Sort by</span>
                            <button class="btn home-sort-bar__btn">Phổ biến</button>
                            <button class="btn home-sort-bar__btn "><a href="">Mới nhất</a></button>
                            <button class="btn home-sort-bar__btn"><a href="">Bán chạy</a></button>

                            <c:set value="${requestScope.sort}" var="sort"/>
                            <div class="sort-price">
                                <span class="sort-price__label">Price
                                    <c:if test="${sort eq 'asc'}">: Lowest</c:if>
                                    <c:if test="${sort eq 'desc'}">: Highest </c:if>
                                </span>
                                <i class="sort-price__input fas fa-angle-down"></i>
                                <ul class="sort-price__list">
                                    <li class="sort-price__item">
                                        <a href="home?sortPrice=asc" class="sort-price__link">
                                        Price: Lowest Price
                                        </a>    
                                    </li>
                                    <li class="sort-price__item">
                                        <a href="home?sortPrice=desc" class="sort-price__link">
                                            Price: Highest Price
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <c:set value="${requestScope.page}" var="page"/>
                            <c:set value="${requestScope.numPage}" var="numPage"/>
                            <div class="home-sort-bar__page">
                                <span class="home-sort-bar__page-num">
                                    <span class="home-sort-bar__page-current">${page}</span>/${numPage}
                                </span>
                                <div class="home-sort-bar__page-control">
                                    <a <c:if test="${page!=1}" >href="home?page=${page-1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if>"</c:if> 
                                        class="home-sort-bar__page-btn">
                                        <i class="home-sort-bar__page-icon fas fa-angle-left ${page==1?"page__number-list-item--disable":""}"></i>
                                    </a>
                                    <a  <c:if test="${page!=numPage}" >href="home?page=${page+1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if>"</c:if>
                                        class="home-sort-bar__page-btn">
                                        <i class="home-sort-bar__page-icon fas fa-angle-right ${page==numPage?"page__number-list-item--disable":""}"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- product -->
                    <div class="product">
                        <div class="row">
                            <c:forEach items="${requestScope.productPage}" var="p">
                            <div class="col-3 product-contain">
                                <div class="product-item">
                                    <a href="product?pid=${p.id}">
                                        <div class="product__img">
                                            <div class="pro_img_contain">
                                                <img class="img-thumbnail" src="./assets/image/products-items/${p.image}" alt="">
                                            </div>
                                        </div>
                                                
                                        <div class="product__description">
                                            <p class="product__description-price-code">£<f:formatNumber type="number" value="${p.price*0.8}"/> with code</p>
                                            <p class="product__description-price-regular">Regular: £${p.price}</p>
                                            <p class="product__description-detail">${p.name}</p>
                                        </div>
                                    </a>
                                </div>    
                            </div>
                            </c:forEach>
                        </div>

                        <!--page-->
                        <div class="page__number-contain">
                            <div class="page__number">
                                <ul class="page__number-lists">
                                    <div class="page__number-list">
                                        <li class="page__number-list-item ">
                                            <a <c:if test="${page!=1}" >href="home?page=${page-1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if>"</c:if> class="page__number-list-link ">
                                                <i class="fa-sharp fa-solid fa-caret-left ${page==1?"page__number-list-item--disable":""}"></i>
                                            </a>
                                        </li>
                                    </div>
                                    <c:forEach begin="1" end="${requestScope.numPage}" var="p">
                                        <div class="page__number-list">
                                            <li class="page__number-list-item ${p==page? "page__number-list-item--active":""}">
                                                <a href="home?page=${p}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if>" class="page__number-list-link ">
                                                    ${p}
                                                </a>
                                            </li>
                                        </div>
                                    </c:forEach>
                                    <div class="page__number-list">
                                        <li class="page__number-list-item ">
                                            <a <c:if test="${page!=numPage}" >href="home?page=${page+1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if>"</c:if> class="page__number-list-link ">
                                                <i class="fa-sharp fa-solid fa-caret-right ${page==numPage?"page__number-list-item--disable":""}"></i>
                                            </a>
                                        </li>
                                    </div>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <%@include file="footer.jsp" %>

    
</body>
</html>
