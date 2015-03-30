<%-- 
    Document   : detailt
    Created on : Mar 30, 2015, 1:29:38 PM
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
        <h1>Hello World!</h1>
        Product Name: ${name} <br/>
        Product Id: ${id} <br/>
        Product Price: ${price} <br/>
        <form action="ViewServlet">
            <input name="button" value="BackToHome" type="submit" />
        </form>
        <form action="CartServlet">
            <input type="hidden" name="productget" value="${name}" />
            <input name="button2" value="AddToCart" type="submit" />
        </form>
    </body>
</html>
