<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_personnel.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <link href="sb-admin-2.css" rel="stylesheet">
        
        <title>CMS</title>
    </head>
    
    
    
<body id="page-top" onbeforeunload = "messageReset();" >
        
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="personnel_sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <%@ include file="personnel_topbar.jsp" %>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid center">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-id-card" aria-hidden="true"></i> View Patient Details</h1>
          
            <div class="row">
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                    
                    
                            <%@ include file="connector.jsp" %>
                            <%@page import="java.sql.*"%>
                            <%
                            String view_patient =  "select * from patient where count = '"+session.getAttribute("patient_id")+"'";
                            Statement stPatient = con.createStatement();
                            ResultSet rsPatient;
                            //rsPatient = stPatient.executeQuery("select count, name, age, birthday, gender, address, phone, tphone, date_updated from patient where acct_status = 'active'");
                            rsPatient = stPatient.executeQuery(view_patient);
                            while (rsPatient.next())
                            {
                                if (rsPatient.getString("acct_status").equals("active"))
                                {
                                    if (session.getAttribute("from_appointment").equals("true"))
                                    { 
                                    %><p><a class="btn btn-secondary btn-user btn-block btnbck" href="personnel_view_appointment.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                                        <p><a class="btn btn-primary btn-user btn-block btnedit" href="personnel_view_patient_edit.jsp"> &nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                    <% 
                                    } 
                                    else    
                                    {
                                    %><p><a class="btn btn-secondary btn-user btn-block btnbck" href="personnel_search_patient.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                                        <p><a class="btn btn-primary btn-user btn-block btnedit" href="personnel_view_patient_edit.jsp"> &nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                    <p><a class="btn btn-primary btn-success btn-user btn-block btnedit" href="personnel_view_patient_appointment.jsp"> &nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Set Appointment</a>
                                    <%
                                    }%>
                                    <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href="personnel_view_patient_prescriptions.jsp"> &nbsp;<i class="fa fa-medkit" aria-hidden="true"></i> View Prescriptions</a>
                                        <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href="personnel_view_patient_history.jsp"> &nbsp;<i class="fa fa-history" aria-hidden="true"></i> View History</a>
                                
                                        <%       
                                }

                                else
                                {
                                    %><p><a class="btn btn-secondary btn-user btn-block btnbck" href="personnel_search_patient_da.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                                    <p><a class="btn btn-primary btn-user btn-block btnedit" href="personnel_view_patient_edit.jsp"> &nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                    <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href="personnel_view_patient_prescriptions.jsp"> &nbsp;<i class="fa fa-medkit" aria-hidden="true"></i> View Prescriptions</a>
                                        <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href="personnel_view_patient_history.jsp"> &nbsp;<i class="fa fa-history" aria-hidden="true"></i> View Patient History</a>
                                
                                        <%
                                }
                            
                            %>
                </div>
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-8 add_patient">
                    <div class="row">
                          
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                            <br>
                            
                            <p>Name : <input id="patient_name" name="name" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("name")%>'disabled></p><%
                                %><p>Birth Date : <input id="patient_bdate" name="bdate" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("birthday")%>'disabled></p><%
                                %>
                                <%
                                        Integer age = 0;
                                        Date currentdate = new Date();
                                        DateFormat Year = new SimpleDateFormat("yyyy");
                                        Integer cy = Integer.parseInt(Year.format(currentdate));
                                        DateFormat month = new SimpleDateFormat("MM");
                                        Integer cm = Integer.parseInt(month.format(currentdate));
                                        DateFormat date = new SimpleDateFormat("dd");
                                        Integer cd = Integer.parseInt(date.format(currentdate));
                                        
                                        Integer by = Integer.parseInt(rsPatient.getString("birthday").toString().substring(0,4));
                                        Integer bm = Integer.parseInt(rsPatient.getString("birthday").toString().substring(5,7));
                                        Integer bd = Integer.parseInt(rsPatient.getString("birthday").toString().substring(8,10));
                                        
                                        if (by == cy)
                                        {
                                            age = 0;
                                        }
                                        else if (by < cy && bm < cm)
                                        {
                                            age = (cy - by);
                                        }
                                        else if (by < cy && bm > cm)
                                        {
                                            age = (cy - by)-1;
                                        }
                                        else if (by < cy && bm == cm && bd > cd)
                                        {
                                            age = (cy - by)-1;
                                        }
                                        else if (by < cy && bm.equals(cm) && bd < cd)
                                        {
                                            age = (cy - by);
                                        }
                                        else if (by < cy && bm == cm && bd.equals(cd))
                                        {
                                            age = (cy - by);
                                        }
                                        else if ( by.equals(cy) && bm < cm)
                                        {
                                            age = 0;
                                        }
                                        else if (by.equals(cy) && bm.equals(cm) && bd < cd)
                                        {
                                            age = 0;
                                        }
                                    %>
                                <p>Age : <input id="patient_age" name="age" class="form-control inpt" id="focusedInput" type="text" value = '<%=age%>'disabled></p><%
                                %><p>Telephone : <input id="patient_telephone" name="tel" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("tphone")%>'disabled></p><%
                                %>Mobile : <div class="row" style =" font-size: 20px"> &nbsp +63 &nbsp <input id="patient_mobile" name="mobile" class="form-control inpt" id="focusedInput" style =" width:75%"value = '<%=rsPatient.getString("phone")%>'disabled></div><%
                                %><br>
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                                <br>                            
                            <p>Sex :<input id="sex" name="sex" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("gender")%>'disabled></p><%
                                %><p>Address : <input id="patient_address" name="address" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("address")%>'disabled></p><%
                                %><p>Marital Status : <input id="status" name="status" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("status")%>'disabled></p>
                                
                            <%
                                if (rsPatient.getString("acct_status").equals("active"))
                                {
                            %><br><p>Account Status : <br><input type = "button" class = "btn btn-user btn-block" Style =" background-color: #1cc88a ; color: #fff; height: 60px; border-radius: 40px 40px 40px 40px; font-size: 25px" value=" Active " disable></p>
                                    <%
                                }
                                else
                                {
                                    %><p>Account Status : <br><input type = "button" class = "btn btn-user btn-block" Style =" background-color: #d62516 ; color: #fff; height: 60px; border-radius: 40px 40px 40px 40px; font-size: 25px" value=" Dectivated "></p>
                                    <%
                                }
                            }
                            %>
                            <br>
                            <h4><center><p><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></p></center></h4>
                            
                            
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                    </div>
                </div>  
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                </div>
            </div>
          
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <%@ include file="footer.jsp" %>  
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <%@ include file="logout_modal.jsp" %>

  <script>
    function messageReset() {
      <%session.setAttribute("edit_message","");%>
    }
    </script>
  
  <!-- Bootstrap core JavaScript-->
  <script src="jquery.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>
    
</html>
