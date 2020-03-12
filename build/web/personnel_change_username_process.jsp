<%@page import="java.util.Objects"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ include file="connector.jsp" %>

<%
    String old_username = request.getParameter("c_username");
    String new_username = request.getParameter("n_username");
    
    Date currentdate = new Date();
    
    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
    String cdate =DFormat.format(currentdate);
    
    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
    String ct = DFormatlog.format(currentdate);
    
    String username = session.getAttribute("uname").toString();
    String password = request.getParameter("password");
  
                Statement stConfirm = con.createStatement();
                ResultSet rsConfirm;
                String stAdd = "update receptionist set username = ? where count ='"+ session.getAttribute("personnelID")+"'";
                PreparedStatement prpAdd = con.prepareStatement(stAdd);
                
            if (old_username.equals(username))
            {
                rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                if (rsConfirm.next()) 
                {
                    prpAdd.setString(1,new_username);
                    prpAdd.execute();

                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Update Details','Change Username from "+old_username+" to "+new_username+"','"+ct+"')";
                    PreparedStatement prpLog = con.prepareStatement(sqlLog);
                    prpLog.execute();

                    session.setAttribute("edit_message", "&#128712 Username Successfully Changed!");
                    session.setAttribute("uname",new_username);
                    response.sendRedirect("personnel_change_username.jsp");
                } 
                else
                {
                    session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                    response.sendRedirect("personnel_change_username.jsp");
                }
            }
            else
            {
                    session.setAttribute("edit_message", "&#128712 Incorrect Current Username!");
                    response.sendRedirect("personnel_change_username.jsp");
            }
          
%>