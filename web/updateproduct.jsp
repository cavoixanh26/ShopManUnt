<%-- 
    Document   : updateproduct
    Created on : 14-Mar-2023, 21:02:14
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>udpate</title>
    </head>
    <body>
        <c:set value="${requestScope.product}" var="product"/>
        <form action="updateproduct" method="post">
            <input name="id" value="${product.id}" type="hidden"/>
            Name: <input name="name" value="${product.name}"/> <br/>
            Price: <input name="price" value="${product.price}"/> <br/>
            Description: <input name="description" value="${product.description}"  style=" height:40px; width:300px" /> <br/>
            Type:  <select name="type">
                <c:forEach items="${requestScope.typeAll}" var="type">
                    <option value="${type.id}">${type.name}</option>
                </c:forEach>
            </select>
            Color:  <select name="color">
                <c:forEach items="${requestScope.colorAll}" var="color">
                    <option value="${color.id}">${color.name}</option>
                </c:forEach>
            </select>
            Brand:  <select name="brand">
                <c:forEach items="${requestScope.brandAll}" var="brand">
                    <option value="${brand.id}">${brand.name}</option>
                </c:forEach>
            </select>

            <table border="1">
                <thead>
                    <tr>
                        <th>Size</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.sizeAll}" var="size">
                        <tr>
                            <td>${size.name}</td>
                            <td><input type="number" name="${size.name}" value="${size.quantity}"/></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            
            <input type="submit" value="Update"/>
        </form>
            <a href="home" >home</a>
            
           

    </body>
</html>
