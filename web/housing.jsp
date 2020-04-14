<%-- 
    Document   : housing.jsp
    Created on : Nov 25, 2018, 12:16:42 PM
    Author     : ketan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@  page import ="java.sql.*"%> 
        <%@   page import="javax.sql.*"%>
        <% 
            String name=request.getParameter("name");
            String addr=request.getParameter("addr");
            String img=request.getParameter("img");
            String wurl=request.getParameter("wurl");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invest_today?useSSL=false", "root", "root");
            
            String qr="insert into housing(name,addr,image,wurl) values(?,?,?,?)";
                PreparedStatement pst=con.prepareStatement(qr);
                pst.setString(1,name);
                pst.setString(2,addr);
                pst.setString(3,img);
                pst.setString(4,wurl);                
                pst.executeUpdate();
                 con.close();
                 pst.close();
                 //out.println("you data has inserted into the table.");
                 response.sendRedirect("housing.html");
                
            %>
    </body>
</html>
