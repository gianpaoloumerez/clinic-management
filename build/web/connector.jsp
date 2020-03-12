<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinic_mngmt", "root", "P@ssw0rd");
            
%>