<%-- 
    Document   : statistic
    Created on : 20-Dec-2022, 21:28:52
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="assets/statistic.js"></script>

        <style>
            .date-body{
                height: 80px;
            }
            .form {
                position: fixed;
                top: 0;
                z-index: 1;
                display: flex;
                justify-content: space-evenly;
            }

            .pro {
                margin-right: 24px;
                line-height: 80px;
            }

            .title-input,
            .input-query {
                display: inline-block;
            }

            .title-input {
                font-size: 20px;
                font-weight: 600;
            }

            .input-query input,
            .input-query select {
                height: 30px;
                border-radius: 5px;
                max-width: 90px;
            }
            .graph-size {
                width: 70%;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="daos" class="dal.DAO_S"/>
        <c:set value="${daos.allYear}" var="years"/>
        <c:set value="${requestScope.top}" var="top"/>
        <c:set value="${requestScope.year}" var="year"/>
        <c:set value="${requestScope.month}" var="month"/>
        <c:set value="${requestScope.day}" var="day"/>
        <c:set value="${requestScope.sort}" var="sort"/>
        <div class="container">
            <div class="date-body">
                <div class="date">
                    <div class="form-date">
                        <form action="statistic" method="get">
                            <div class="form">
                                <div class="pro">
                                    <div class="title-input">
                                        <span>Top</span>
                                    </div>

                                    <div class="input-query">
                                        <input type="number" value="${top}" name="top">
                                    </div>
                                </div>
                                <div class="pro">
                                    <div class="title-input">
                                        <span>Year</span>
                                    </div>
                                    <div class="input-query">
                                        <select name="year" >
                                            <option value=""></option>
                                            <c:forEach begin="${0}" end="${years.size() - 1}" var="i">
                                                <option value="${years.get(i)}" ${year==years.get(i)?"selected":""}>${years.get(i)}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="pro">
                                    <div class="title-input">
                                        <span>Month</span>
                                    </div>
                                    <div class="input-query">
                                        <select name="month">
                                            <option value=""></option>
                                            <c:forEach begin="1" end="12" var="i">
                                                <option value="${i}" ${month==i?"selected":""}>${i}</option>    
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="pro">
                                    <div class="title-input">
                                        <span>Day</span>
                                    </div>
                                    <div class="input-query">
                                        <select name="day" >
                                            <option value=""></option>
                                            <c:forEach begin="1" end="31" var="i">
                                                <option value="${i}" ${day==i?"selected":""}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="pro">
                                    <div class="title-input">
                                        <span>SORT</span>
                                    </div>
                                    <div class="input-query">
                                        <select name="sort">
                                            <option value="asc" ${sort eq 'asc' ?"selected":""}>ASC</option>
                                            <option value="desc" ${sort eq 'desc' ?"selected":""}>DESC</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="graph" >
                <div class="graph-content">
                    <div class="graph-main">
                        <div class="row">
                            <div class="col-5">
                                <div class="graph-size">
                                    <canvas  id="myChart"></canvas>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="graph-info">
                                    <div class="g-title">
                                        <span>do thi 1</span>
                                    </div>
                                    <div class="g-des">
                                        <p><a href="product?pid=${pts.get(0).product.id}">san phan ban ${sort eq 'asc' ? "it nhat":"nhieu nhat"} co id: ${pts.get(0).product.id}</a></p>
                                        <p>So luong: ${pts.get(0).quantity}</p>
                                        <p>skaldjalkdjakdljdklajdkladjkladjlasfsa</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="graph" >
                <div class="graph-content">
                    <div class="graph-main">
                        <div class="row">
                            <div class="col-5">
                                <div class="graph-size" style="width: 100%;">
                                    <canvas id="myChart1"></canvas>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="graph-info">
                                    <div class="g-title">
                                        <span>do thi 1</span>
                                    </div>
                                    <div class="g-des">
                                        <p><a href="product?pid=${pts.get(0).product.id}">san phan ban ${sort eq 'asc' ? "it nhat":"nhieu nhat"} co id: ${pts.get(0).product.id}</a></p>
                                        <p>So luong: ${pts.get(0).quantity}</p>
                                        <p>skaldjalkdjakdljdklajdkladjkladjlasfsa</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                            
        </div>



        <c:set value="${requestScope.pts}" var="pts"/>
        <c:set value="${requestScope.chart1}" var="chart1"/>
        <script>
            let cateLabels = [], cateInfo = [], cateLabels1 = [], cateInfo1 = [];
            <c:forEach items="${pts}" var="i">
            cateLabels.push('id: ${i.product.id}');
            cateInfo.push('${i.quantity}');
            </c:forEach>

            <c:if test="${year==null}">
                <c:forEach begin="${0}" end="${years.size() - 1}" var="i">
            cateLabels1.push('${years.get(i)}');
                </c:forEach>
            </c:if>
            <c:if test="${year!=null&&month==null}">
                <c:forEach begin="1" end="12" var="i">
            cateLabels1.push('thang:${i}');
                </c:forEach>
            </c:if>
            <c:if test="${year!=null&&month!=null}">
                <c:forEach begin="1" end="31" var="i">
            cateLabels1.push('ngay:${i}');
                </c:forEach>
            </c:if>

            <c:forEach items="${chart1}" var="i">
            cateInfo1.push('${i}');
            </c:forEach>

            window.onload = function () {
                cateChart("myChart", cateLabels, cateInfo);
                cateChart1("myChart1", cateLabels1, cateInfo1);
            };
        </script>
    </body>
</html>
