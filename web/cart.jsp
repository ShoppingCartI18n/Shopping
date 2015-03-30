<%-- 
    Document   : cart
    Created on : Mar 30, 2015, 1:29:19 PM
    Author     : dattr_000
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cart</h1>
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
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">Name</td>
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">Price</td>
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">Quantity</td>
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">Total</td>
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">Action</td>
            </tr>
            <c:forEach var="product" items="${itemlist}">
                <tr>
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">${product.name}</td>
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">${product.price}</td>
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">${product.quantity}</td>
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">${product.quantity*product.price}</td>
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">
                        <form action="CartServlet">
                            <input type="hidden" name="name_del" value="${product.name}" />
                            <input name="button2" style="width: 100px; background: red;" type="submit" value="Delete" />
                        </form>
                    </td>

                </tr>
            </c:forEach>
            <tr style="border: 1px solid black; width:450px; height: 30px; font-family: fantasy; font-size: small; ">
                <td style="width: 100px;background: blue;color: white;">
                    Total Product:
                </td>
                <td style="width: 100px;background: cyan;color: red;text-align: center;">
                    <%
                        ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("itemlist");
                        int totalitems = 0;
                        for (int i = 0; i < list.size(); i++) {
                            totalitems += list.get(i).getQuantity();
                        }
                        out.println(totalitems);
                    %>
                </td>
                <td style="width: 50px;background: blue;color: white;">

                </td>
                <td style=" width: 100px;background: blue;color: white;">
                    Order Total:
                </td>
                <td style="width: 100px;background: cyan;color: red; text-align: center;">
                    <%
                        ArrayList<Product> list2 = (ArrayList<Product>) session.getAttribute("itemlist");
                        double totalorder = 0;
                        for (int i = 0; i < list.size(); i++) {
                            totalorder += list2.get(i).getQuantity() * list2.get(i).getPrice();
                        }
                        out.println("$" + totalorder);
                    %>
                </td>
            </tr>
        </table>
        <form action="ViewServlet">
            <input name="button" value="BackToHome" type="submit" />
        </form>
        <form action="CartServlet">
            <input type="hidden" name="productget" value="${name}" />
            <input name="button2" value="CheckOut" type="submit" />
        </form>

    </body>
</html>
