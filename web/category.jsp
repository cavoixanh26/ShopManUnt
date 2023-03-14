<%-- 
    Document   : category
    Created on : 11-Dec-2022, 23:21:04
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
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
                                    <li class="category__item ${idCategory==c.id ? " category__item--active":""}"><a href="category?idCategory=${c.id}" class="category__item-link ">${c.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </nav>

                        <nav class="category">
                            <form action="category" method="get">
                                <input type="hidden" name="idCategory" value="${requestScope.idCategory}"/>
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
                                    <c:set value="${requestScope.ctype}" var="ctype"/>
                                    <c:set value="${requestScope.type}" var="type"/>
                                    <c:set value="${requestScope.types}" var="types"/>
                                    <div class="category__items collapse" id="type">
                                        <c:forEach begin="0" end="${type.size()-1}" var="t">
                                            <li class="category__item ">
                                                <label>
                                                    <input type="checkbox" ${ctype[t]?"checked":""}  value="${type.get(t).getName()}" name="type"> ${type.get(t).getName()}
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
                                    <c:set value="${requestScope.cbrand}" var="cbrand"/>
                                    <c:set value="${requestScope.brand}" var="brand"/>
                                    <c:set value="${requestScope.brands}" var="brands"/>
                                    <div class="category__items collapse" id="brand">
                                        <c:forEach begin="0" end="${brand.size()-1}" var="b">
                                            <li class="category__item ">
                                                <label>
                                                    <input type="checkbox" ${cbrand[b]?"checked":""} name="brand" value="${brand.get(b).getName()}"> ${brand.get(b).getName()}
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
                                    <c:set value="${requestScope.ccolor}" var="ccolor"/>
                                    <c:set value="${requestScope.color}" var="color"/>
                                    <c:set value="${requestScope.colors}" var="colors"/>
                                    <div class="category__items collapse" id="color">
                                        <c:forEach begin="0" end="${color.size()-1}" var="c">
                                            <li class="category__item ">
                                                <label>
                                                    <input type="checkbox" ${ccolor[c]?"checked":""} value="${color.get(c).getName()}" name="color"> ${color.get(c).getName()}
                                                </label>
                                            </li>
                                        </c:forEach>
                                    </div>
                                </ul>

                                <c:set value="${requestScope.priceFrom}" var="priceFrom"/>
                                <c:set value="${requestScope.priceTo}" var="priceTo"/>

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
                                                <a href="category?idCategory=${idCategory}&sortPrice=asc<c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>" class="sort-price__link">
                                                        Price: Lowest Price
                                                    </a>    
                                                </li>
                                                <li class="sort-price__item">
                                                    <a href="category?idCategory=${idCategory}&sortPrice=desc<c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>" class="sort-price__link">
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
                                        <a <c:if test="${page!=1}" >href="category?idCategory=${idCategory}&page=${page-1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if><c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>"</c:if> 
                                                                    class="home-sort-bar__page-btn">
                                                                                                    <i class="home-sort-bar__page-icon fas fa-angle-left ${page==1?"page__number-list-item--disable":""}"></i>
                                        </a>
                                        <a  <c:if test="${page!=numPage}" >href="category?idCategory=${idCategory}&page=${page+1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if><c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>"</c:if>
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
                                                <a <c:if test="${page!=1}" >href="category?idCategory=${idCategory}&page=${page-1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if><c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>"</c:if> class="page__number-list-link ">
                                                    <i class="fa-sharp fa-solid fa-caret-left ${page==1?"page__number-list-item--disable":""}"></i>
                                                </a>
                                            </li>
                                        </div>
                                        <c:forEach begin="1" end="${requestScope.numPage}" var="p">
                                            <div class="page__number-list">
                                                <li class="page__number-list-item ${p==page? "page__number-list-item--active":""}">
                                                    <a href="category?idCategory=${idCategory}&page=${p}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if><c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>" class="page__number-list-link ">
                                                        ${p}
                                                    </a>
                                                </li>
                                            </div>
                                        </c:forEach>
                                        <div class="page__number-list">
                                            <li class="page__number-list-item ">
                                                <a <c:if test="${page!=numPage}" >href="category?idCategory=${idCategory}&page=${page+1}<c:if test="${sort!=null}">&sortPrice=${sort}</c:if><c:if test="${types!=null}"><c:forEach items="${types}" var="t">&type=${t}</c:forEach></c:if><c:if test="${brands!=null}"><c:forEach items="${brands}" var="t">&brand=${t}</c:forEach></c:if><c:if test="${colors!=null}"><c:forEach items="${colors}" var="t">&color=${t}</c:forEach></c:if><c:if test="${priceFrom!=null}">&priceFrom=${priceFrom}</c:if><c:if test="${priceTo!=null}">&priceTo=${priceTo}</c:if>"</c:if> class="page__number-list-link ">
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
        <%@include file="footer.jsp"%>

    </body>
</html>
