<%-- 
    Document   : home
    Created on : Mar 30, 2015, 1:29:12 PM
    Author     : dattr_000
--%>

<%@page import="Model.ProductModel"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Product"%>
<%@page import="Bean.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Product</title>
    </head>
    <body>
        <%
              List<Product> product = new ProductModel().getData();
            request.setAttribute("listPro", product);
        %>
        
        <h1>List Product</h1>
        <table style="font-family: verdana,arial,sans-serif;
               font-size:11px;
               color:#333333;
               border-width: 1px;
               border-color: #999999;
               border-collapse: collapse;">
            <tr style="background-color: activeborder;
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #999999;">
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">PRODUCT NAME</td>
            </tr>
            <c:forEach items="${listPro}" var="product">
                <tr style="background-color: activeborder;
                    border-width: 1px;
                    padding: 8px;
                    border-style: solid;
                    border-color: #999999;">
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">${product.name}</td>
                    <td style="width: 100px; text-align: center;">
                        <form action="ViewServlet">
                            <input type="hidden" name="name_out" value="${product.name}" />
                            <input name="button" style="width: 100px; background: red;" type="submit" value="View Detail" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
