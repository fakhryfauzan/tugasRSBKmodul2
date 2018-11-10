<%-- 
    Document   : subcategory
    Created on : Oct 6, 2016, 2:34:00 PM
    Author     : Oops
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/home.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="header.jsp"%>
        <title>Sub_Category</title>
    </head>
    <body>
        <h1></h1>
          <%
     try{
         String cname = request.getParameter("cname");
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from book where bcategory = '"+cname+"'");
         
         while(rs.next())
         {
             String book = rs.getString("bname");
             String book_des = rs.getString("bdes");
             String gambar = rs.getString("gambar");
             
             %>
            
             <h1 style="width: 800px"> <%out.print(book); %><br><%
              out.print( " "+book_des);
         }
        }catch(Exception e){
            
        }
     %>
        
       
    </body>
</html>
