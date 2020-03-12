<%@page import="java.util.Objects"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ include file="connector.jsp" %>

<%
    String old_password = request.getParameter("c_password");
    String new_password = request.getParameter("n_password");
    
    Date currentdate = new Date();
    
    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
    String cdate =DFormat.format(currentdate);
    
    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
    String ct = DFormatlog.format(currentdate);
    
    String username = session.getAttribute("uname").toString();
    String password = request.getParameter("password");
  
                Statement stConfirm = con.createStatement();
                ResultSet rsConfirm;
                String stAdd = "update receptionist set password = ? where count ='"+ session.getAttribute("personnelID")+"'";
                PreparedStatement prpAdd = con.prepareStatement(stAdd);
                
            
                rsConfirm = stConfirm.executeQuery("select * from receptionist where username='"+username+"' and password='"+password+"'");
                if (rsConfirm.next()) 
                {
                    if (old_password.equals(password))
                    {
                        prpAdd.setString(1,new_password);
                        prpAdd.execute();

                        String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Update Details','Changed Password','"+ct+"')";
                        PreparedStatement prpLog = con.prepareStatement(sqlLog);
                        prpLog.execute();

                        session.setAttribute("edit_message", "&#128712 Password Successfully Changed!");
                        response.sendRedirect("personnel_change_password.jsp");
                    }
                    else
                    {
                        session.setAttribute("edit_message", "&#128712 Incorrect Current Password!");
                        response.sendRedirect("personnel_change_password.jsp");
                    }
                
                }
                else
                {
                    session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again");
                    response.sendRedirect("personnel_change_password.jsp");
                }
            
%>