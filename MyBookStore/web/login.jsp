<%-- 
    Document   : login
    Created on : Jun 1, 2018, 4:40:42 PM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="header.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        
        <div>
            <div class="reg_back">
                <h1 style="margin-left: 70px;">Login Form</h1>
          <form action="Login" method="post">
            <pre>
         <input name="email" placeholder="email"    type="text"> 

         <input name="pass"  placeholder="password" type="password"> 
            

        <input value="Login"   type="submit" class="btn" style="padding-bottom: 30px;"> 

            </pre>
            </form> 
            </div>
        </div>
  
       
    </body>
</html>
