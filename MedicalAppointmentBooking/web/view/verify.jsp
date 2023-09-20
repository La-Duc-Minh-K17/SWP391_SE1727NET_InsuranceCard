<%-- 
    Document   : verify
    Created on : Sep 14, 2023, 10:39:04 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <span>We already sent a verification to your email</span>
        <form action="verify" method="post">
            <input type="text" name="authcode">
            <input type="submit" value="Verify">
        </form>
    </body>
</html>
