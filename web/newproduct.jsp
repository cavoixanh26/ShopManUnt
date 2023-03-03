<%-- 
    Document   : newproduct.jsp
    Created on : 24-Dec-2022, 21:20:12
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="dao" class="dal.DAO"/>
        <c:set value="${dao.getProductById(pid, null)}" var="product"/>
        <h3>Add New Product</h3>
        <div>
            <form action="newproduct" method="get">
                <input type="text" name="name" placeholder="name" required="" value="${product.name}"/><br>
                <select name="category">
                    <option>-category-</option>
                    <c:set value="${dao.allCategory}" var="category"/>
                    <c:forEach items="${category}" var="i">
                        <option value="${i.id}" ${product.idCategory==i.id?"selected":""}>${i.name}</option>
                    </c:forEach>
                    <option><a href="">add new category</a></option>
                </select>
                <select name="type">
                    <option>-type-</option>
                    <c:set value="${dao.allType}" var="type"/>
                    <c:forEach items="${type}" var="t">
                        <option value="${t.id}"${product.idType==t.id?"selected":""}>${t.name}</option>
                    </c:forEach>
                    <option><a href="">add new type</a></option>
                </select>
                <select name="color">
                    <option>-color-</option>
                    <c:set value="${dao.allColor}" var="color"/>
                    <c:forEach items="${color}" var="i">
                        <option value="${i.id}" ${product.idColor==i.id?"selected":""}>${i.name}</option>
                    </c:forEach>
                    <option><a href="">add new color</a></option>
                </select>
                <select name="brand">
                    <option>-brand-</option>
                    <c:set value="${dao.allBrand}" var="brand"/>
                    <c:forEach items="${brand}" var="i">
                        <option value="${i.id}" ${product.idBrand==i.id?"selected":""}>${i.name}</option>
                    </c:forEach>
                    <option><a href="">add new brand</a></option>
                </select> <br>
                <input type="text" name="price" placeholder="price" required="" value="${product.price}"/> <br/>
                <input type="text" name="des" placeholder="description" required="" value="${product.description}"/> <br/>
                tro truc tiep den anh: <input type="file" name="img" required=""/>
                <c:if test="${pid!=null}">
                    <img src="assets/image/products-items/${product.image}" alt="alt" width="100px" height="100px"/>    
                </c:if>
                
                <input type="submit" value="ADD"/>
            </form>
        </div>
        <c:set value="${requestScope.pid}" var="pid"/>
        <c:if test="${pid!=null}">
            <div>
                <div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Size</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${dao.getAllSize(pid)}" var="i">
                                <tr>
                                    <td>${i.name}</td>
                                    <td>${i.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                </div>
                <form action="addsize" method="get">
                    <input type="text" name="pid" value="${pid}" readonly=""/>
                    <input type="text" name="name" placeholder="name size">
                    <input type="number" name="quantity"/> <br/>
                    <input type="submit" value="add"/>
                </form>
                <form action="addsize" method="post">
                    <input type="submit" value="end"/>
                </form>
            </div>
        </c:if>

    </body>
</html>
