<%-- 
    Document   : detail
    Created on : Jun 2, 2018, 1:51:05 AM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    </head>
    <body>
        <%
        String iddetail = request.getParameter("employee_id");    
        if(iddetail != null){
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
            
         
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from book where bname = '"+iddetail+"'");
           while(rs.next())
         {
            String gambar = rs.getString("gambar");
            String bookdes = rs.getString("bdes");
            String bcat = rs.getString("bcategory");
            int stok = rs.getInt("stok");
            int harga  = rs.getInt("harga");
            
          %> 
          Deskripsi : <%out.print(bookdes); %>
          <br>
          Kategori : <%out.print(bcat); %>
          <br>
          Stok : <%out.print(stok); %>
          <br>
          Harga : Rp. <%out.print(harga); 
            if(stok < 5){
               %>
          <br> <br> <br>
        <% out.println("STOK INGIN HABIS, SEGERA LAPOR PEMASOK");
            }
          %>
          <br>
        <%
         }
        }
        %>
    </body>
</html>
