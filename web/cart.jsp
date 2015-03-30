<%-- 
    Document   : cart
    Created on : Mar 30, 2015, 1:29:19 PM
    Author     : dattr_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <td style="width: 30px;border-width: 1px; border-style: solid; border-color: #999999;text-align: center;">STT</td>
                <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">PRODUCT NAME</td>
                <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">PRICE</td>
                <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">QUANTITY</td>
                <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">TOTAL PRICE</td>
                <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">ACTION</td>
            </tr>
            <c:forEach items="${itemlist}" var="product">
                <tr style="background-color: activeborder;" >
                    <td style="width: 30px;border-width: 1px; border-style: solid; border-color: #999999;text-align: center;">
                        1
                    </td>
                    <td style="width: 100px;border-width: 1px; border-style: solid; border-color: #999999;">${product.getName()}</td>
                    <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">${product.getPrice()}</td>
                    <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">${product.getCount()}</td>
                    <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">
                        ${product.getCount()*product.getPrice()}
                    </td>
                    <td style="width: 80px;border-width: 1px; border-style: solid; border-color: #999999;">
                        <form action="addServlet">
                            <input type="hidden" name="name_del" value="${product.getName()}" />
                            <input name="button" style="width: 100px; background: red;" type="submit" value="Del" />
                        </form>
                    </td> 
                </tr>
            </c:forEach>
            <tr style="height: 20px; background-color: orange"></tr>
            <tr style="border: 1px solid black; width:450px; height: 30px; font-family: fantasy; font-size: small; ">
                <td style="width: 100px;background: blue;color: white;">
                    Total Product:
                </td>
                <td style="width: 100px;background: cyan;color: red;text-align: center;">
                    <%
                        ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("itemlist");
                        int totalitems = 0;
                        for (int i = 0; i < list.size(); i++) {
                            totalitems += list.get(i).getCount();
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
                            totalorder += list2.get(i).getCount() * list2.get(i).getPrice();
                        }
                        out.println(totalorder + " $");
                    %>

                </td>
            </tr>
            <tr style="height: 20px; background-color: orange"></tr>
            <tr>
            <form action="addServlet">
                <td><input style="font-size: 16px;color: white;height: 60px;width: 200px; background-color: turquoise;" type="submit" name="button" value="CONTINUE SHOPPING" /></td>
                <td><input style="font-size: 16px;color: white;height: 60px; width: 200px; background-color: turquoise;"  type="submit" name="button" value="CHECKOUT" /></td>
            </form>
        </tr>
    </table>
    </body>
</html>
