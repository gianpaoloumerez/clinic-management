<%@page import="java.util.Objects"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ include file="connector.jsp" %>

<%
    String name = request.getParameter("name");
    String telephone = request.getParameter("tel");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");
    String status = request.getParameter("status");
    String email = request.getParameter("email");
    
    Date currentdate = new Date();
    
    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
    String cdate =DFormat.format(currentdate);
    
    //String bdate = DFormat.format(request.getParameter("bdate"));
    String bdate = request.getParameter("bdate");
    
    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
    String ct = DFormatlog.format(currentdate);
    
    String username = session.getAttribute("uname").toString();
    String password = request.getParameter("password");
  
            String birthdate = request.getParameter("bdate").toString();

            String by = birthdate.substring(0,4);
            String bm = birthdate.substring(5,7);
            String bd = birthdate.substring(8,10);

            Integer age = 0;


            DateFormat year = new SimpleDateFormat("yyyy");
            DateFormat month = new SimpleDateFormat("MM");
            DateFormat date = new SimpleDateFormat("dd");

            Integer byear = Integer.parseInt(by);
            Integer bmonth = Integer.parseInt(bm);
            Integer bday = Integer.parseInt(bd);

            Integer cyear = Integer.parseInt(year.format(currentdate));
            Integer cmonth = Integer.parseInt(month.format(currentdate));
            Integer cday = Integer.parseInt(date.format(currentdate));

            if (byear > cyear)
            {   
                age = -1;
            }
            else if (byear.equals(cyear) && bmonth > cmonth)
            {
                age = -1;
            }
            else if (byear.equals(cyear) && bmonth.equals(cmonth) && bday>cday)
            {
                age = -1;
            }
            else if (byear < cyear && bmonth < cmonth)
            {
                age = (cyear - byear);
            }
            else if (byear < cyear && bmonth > cmonth)
            {
                age = (cyear - byear)-1;
            }
            else if (byear < cyear && bmonth == cmonth && bday > cday)
            {
                age = (cyear - byear)-1;
            }
            else if (byear < cyear && bmonth.equals(cmonth) && bday < cday)
            {
                age = (cyear - byear);
            }
            else if (byear < cyear && bmonth == cmonth && bday.equals(cday))
            {
                age = (cyear - byear);
            }
            else if ( byear.equals(year) && bmonth < cmonth)
            {
                age = 0;
            }
            else if (byear.equals(cyear) && bmonth.equals(cmonth) && bday < cday)
            {
                age = 0;
            }

            if (age > -1)
            {
                Statement stConfirm = con.createStatement();
                ResultSet rsConfirm;
                String stAdd = "update doctor set name = ?,  address = ?, phone = ?, tphone = ?, status = ?, email = ?,  date_updated = ? where count ='"+ session.getAttribute("doctorID")+"'";
                PreparedStatement prpAdd = con.prepareStatement(stAdd);

                rsConfirm = stConfirm.executeQuery("select * from doctor where username='" + username + "' and password='" + password + "'");
                if (rsConfirm.next()) 
                {
                    prpAdd.setString(1,name);
                    prpAdd.setString(2,address);
                    prpAdd.setString(3,mobile);
                    prpAdd.setString(4,telephone);
                    prpAdd.setString(5,status);
                    prpAdd.setString(6,email);
                    prpAdd.setString(7,cdate);
                    prpAdd.execute();

                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('doctor', '"+username+"','"+cdate+"','Update Details','Edited Profile "+name+"','"+ct+"')";
                    PreparedStatement prpLog = con.prepareStatement(sqlLog);
                    prpLog.execute();

                    session.setAttribute("edit_message", "&#128712 Details Successfully Updated!");
                    response.sendRedirect("doctor_update_profile.jsp");
                } 
                else
                {
                    session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                    response.sendRedirect("doctor_update_profile.jsp");
                }
            }
            else 
            {
               session.setAttribute("edit_message", "&#128712 Invalid Birthdate Please Try Again");
               response.sendRedirect("doctor_update_profile.jsp"); 
            }
%>