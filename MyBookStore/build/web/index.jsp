<%-- 
    Document   : index
    Created on : Jun 1, 2018, 4:40:42 PM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
--%>

<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="ejb.ListElementsRemote"%>
<%@page import="ejb.ListElementsRemote2"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
    private static ListElementsRemote values;

    public void jspInit(){
    try{
        InitialContext ic = new InitialContext();
        values = (ListElementsRemote)ic.lookup("java:global/MyBookStore/ListElements");
    }
    catch (Exception e ) {
         System.out.println(e); 
    }
}
%>

<%
    
    if(request.getParameter("addNum") !=null){
        String e = request.getParameter("t1");
        int e2 = Integer.parseInt(request.getParameter("t2"));
        out.println(e2);
        Connection myConn = null;
        PreparedStatement myStmt = null;
        PreparedStatement myStmt2 = null;
        PreparedStatement myStmt3 = null;
        ResultSet myRs = null;
        int myRs2;
        int myRs3;
        
           
       try{
        myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
        myStmt = myConn.prepareStatement("select * from book where bname = ?");
        myStmt.setString(1, e);
        out.println(e);
        myRs = myStmt.executeQuery();
        myStmt3 = myConn.prepareStatement("insert into jumlah (barang2, harga2) values (?, ?)");
        myStmt3.setString(1, e);
        myStmt3.setInt(2, e2);
        myRs3 = myStmt3.executeUpdate();
        while(myRs.next()){
        int stok = myRs.getInt("stok");
        out.println(stok);
         int stok2 = stok - 1; 
         out.println(stok2);
        myStmt2 = myConn.prepareStatement("update book set stok = '"+stok2+"' where bname = ? ");
        myStmt2.setString(1, e);
        myRs2 = myStmt2.executeUpdate();
        }}
      catch(Exception ee){
            out.println(ee);
       }
        values.addElement(e);
  
    }
    
   /** if(request.getParameter("remNum") !=null){
        String e = request.getParameter("t1");
        int e2 = Integer.parseInt(request.getParameter("t2"));
        out.println(e2);
        Connection myConn = null;
        PreparedStatement myStmt = null;
        PreparedStatement myStmt2 = null;
        ResultSet myRs = null;
        int myRs2;
       try{
        myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
        myStmt = myConn.prepareStatement("select * from book where bname = ?");
        myStmt.setString(1, e);
         out.println(e);
        myRs = myStmt.executeQuery();
        while(myRs.next()){
        int stok = myRs.getInt("stok");
        out.println(stok);
         int stok2 = stok + 1; 
         out.println(stok2);
        myStmt2 = myConn.prepareStatement("update book set stok = '"+stok2+"' where bname = ? ");
        myStmt2.setString(1, e);
        myRs2 = myStmt2.executeUpdate();
        }}
      catch(Exception ee){
            out.println(ee);
       }
       values.removeElement(e);
   
        
    }**/
%>

<html>
<head>
<title>sewa buku bujank</title>

<link href="css/home.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ include file="header.jsp"%>
<script type="text/javascript">
     $(document).ready(function(){  
      $('.view_data').click(function(){  
           var employee_id = $(this).attr("id");  
           $.ajax({  
                url:"detail.jsp",  
                method:"post",  
                data:{employee_id:employee_id},  
                success:function(data){  
                     $('#employee_detail').html(data);  
                     $('#dataModal').modal("show");  
                }  
           });  
      });  
 });
</script>
</head>
<body>
   
     <%
         HttpSession session1=request.getSession(false);
         if(session1!=null){
            String name=(String)session1.getAttribute("name");  
           
         }
     try{
        
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from book");
         
         while(rs.next())
         {
             //String uid = rs.getString("uid");
             String book = rs.getString("bname");
             String gambar = rs.getString("gambar");
             String bookdes = rs.getString("bdes");
             String bcat = rs.getString("bcategory");
             int stok = rs.getInt("stok");
             int harga = rs.getInt("harga");
             %>
             <div class="col-md-4">
             <div class="img-with-text">
             <img src="image/<%out.print(gambar); %>" width="200" height="180" id="image_spc" style="margin-left: 60px;"> 
             
             
             <form name="abc" method="post">
               
                 <input type="hidden" name="t1" value="<% out.print(book); %>">
                 <input type="hidden" name="t2" value="<% out.print(harga); %>">
                 <% out.print(book); %>
                 <br><input type="submit" value="Add" name="addNum">
                
            </form><button  name="view" value="view" id="<%out.print(book); %>" class="view_data"> Detail </button>
             <div id="dataModal" class="modal fade">  
		      <div class="modal-dialog">  
		           <div class="modal-content">  
		                <div class="modal-header">  
		                     <button type="button" class="close" data-dismiss="modal">&times;</button>  
		                     <h4 class="modal-title">Detail Buku</h4>  
		                </div>  
		                <div class="modal-body" id="employee_detail"> 
                                    <% out.print( " "+book); %>
		                </div>  
		                <div class="modal-footer">  
		                     
		                </div>  
		           </div>  
		      </div>  
		 </div>
           
            
            </div> 
                                </div>
             <%
                 
         }
        }catch(Exception e){
            
        }
     %>
    <div class="b">
       
    </div>
     
         <div class="container">
             <img src="https://cdn4.iconfinder.com/data/icons/shopping-21/64/shopping-06-512.png" alt="W3Schools.com" style="width:104px;height:142px;"></br>
             <%
         out.println("Total Belanja");
                    if(values != null){
                        
                        List<String> nums = values.getElements();
                       
                       
                        for(String value : nums){
                            out.println("<br>" + value);
                        }
                        %>
                       
                        <br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Total Belanja dan Total Harga</button>
                        <div class="modal fade" id="myModal" role="dialog">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Total</h4>
                              </div>
                              <div class="modal-body">
                                 
                                  <p> <table>
                                      <tr>
                                        <th>Buku</th>
                                        <th>Harga</th>
                                      </tr>
                                            <%
                                              Connection myConn = null;
                                              PreparedStatement myStmt4 = null;  
                                              ResultSet myRs4 = null;
                                              PreparedStatement myStmt5 = null;  
                                              ResultSet myRs5 = null;
                                              myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
                                              myStmt4 = myConn.prepareStatement("select * from jumlah");
                                              myRs4 = myStmt4.executeQuery();
                                              myStmt5 = myConn.prepareStatement("select sum(harga2) from jumlah");
                                              myRs5 = myStmt5.executeQuery();
                                               
                                              while(myRs4.next()){
                                               int harga2 = myRs4.getInt("harga2");
                                               String barang2 = myRs4.getString("barang2");
                                            %><tr><td> <%  out.println(barang2);%></td><td>
                                                    
                                                  <%  out.println(" Rp " +harga2);%>
                                            </td></tr><%
                                        }
                                                 %>
                                            </p></table><br>
                                  Total Pembelian adalah Rp
                                  <%
                                      while(myRs5.next()){
                                                int sum = myRs5.getInt("sum(harga2)");
                                                  out.println(sum);
                                               }
                                  %>
                                  <br>    Harap segera bayar dengan transfer ke rekening BCA Kami  yaitu XXX-XXX-XXX A/N kelompok 14
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                          </div>
                        </div>
                       <% 
                        out.println("<br> Size = " + nums.size()); 
                        if(nums.size() == 0){
                            
                            PreparedStatement myStmt6 = null;
                            int myRs6;
                            myStmt6 = myConn.prepareStatement("DELETE FROM jumlah;");
                            myRs6 = myStmt6.executeUpdate();
                        }
                     
                      
                    }else{
                        out.print("Data Kosong");
                    }
                %></div>
</body>
</html> 