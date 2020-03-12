<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_doctor.jsp" %>
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
	
        <<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <link href="dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="sb-admin-2.css" rel="stylesheet">
        
        <title>CMS</title>
    </head>
    
    
    
<body id="page-top" onbeforeunload = "messageReset();" >
        
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="doctor_sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <%@ include file="doctor_topbar.jsp" %>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid center">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-calendar" aria-hidden="true"></i> View Appointment</h1>
          <h4 style="color: #17a673"><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></h4>
          <h4 style="color: #be2617"><% try {if(session.getAttribute("edit_message_error").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message_error"));}} catch (Exception e) {out.print(" ");}%></h4>
          <br>      
            <div class="row">
                            
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                    
                    
                            <%@ include file="connector.jsp" %>
                            <%@page import="java.sql.*"%>
                            <%
                            DateFormat DFormatlog = new SimpleDateFormat("H:mm");
                            
                            String view_appt =  "select * from appointment where count = '"+session.getAttribute("appointment_id")+"'";
                            Statement stAppt = con.createStatement();
                            ResultSet rsAppt;
                            //rsPatient = stPatient.executeQuery("select count, name, age, birthday, gender, address, phone, tphone, date_updated from patient where acct_status = 'active'");
                            rsAppt = stAppt.executeQuery(view_appt);
                            while (rsAppt.next())
                            {
                            //String time_sched = rsPatient.getString("time").toString();
                            //Date sched_time = DFormatlog.parse(time_sched);
                            %>
                            <p><a class="btn btn-secondary btn-user btn-block btnbck" href="doctor_dashboard.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                                    <p><a class="btn btn-primary btn-user btn-block btnedit" href="" data-toggle="modal" data-target="#final_diagnosis"> &nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update Diagnosis</a>
                                    <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href=""> &nbsp;<i class="fa fa-history" aria-hidden="true"></i> View Patient History</a>
                                    <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href=""> &nbsp;<i class="fa fa-medkit" aria-hidden="true"></i> View Prescriptions</a>
                                    
                </div>
                            <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                                <div class="card shadow mb-4 cardcustom">
                                    <div class=" py-3 tablebg">
                        <div class ="row">
                           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-address-card" aria-hidden="true"></i> Patient Details</h5>
                        </div>
                     </div>
                                    <div class="card-body">
                            
                                <%
                                    String view_patient =  "select * from patient where count = '"+session.getAttribute("patient_id")+"'";
                                    Statement stPatient = con.createStatement();
                                    ResultSet rsPatient;
                                    rsPatient = stPatient.executeQuery(view_patient);
                                    while (rsPatient.next())
                            {
                                %><p>&nbsp;Patient Name :<h2 style="color: #000"><%=rsPatient.getString("name")%></h2></p><%
                                    %>
                                <%  
                            }
                            %>
                                    <p>&nbsp;Height : <h4 style="color: #000"><%=rsAppt.getString("height")%> cm</h4></p><%
                                %><p>&nbsp;Weight : <h4 style="color: #000"><%=rsAppt.getString("weight")%> Kg</h4></p><%
                                    %>&nbsp;Blood Pressure : <br>
                                    <div class = "row">&nbsp;&nbsp;&nbsp;&nbsp; <h4 style="color: #000"><%=rsAppt.getString("bp1")%>
                                            &nbsp; / &nbsp; <%=rsAppt.getString("bp2")%></h4>
                                </div>
                            <br></div>
                                </div>
                            </div>
                             
                                
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-5">
                     <div class="card shadow mb-4 cardcustom"> 
                    <div class=" py-3 tablebg">
                        <div class ="row">
                           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-address-card" aria-hidden="true"></i> Appointment History</h5>
                        </div>
                     </div>
                    <div class="card-body">
                        
                        <%
                            Integer num = 0;    
                            String appt_hist =  "select * from appointment where count = '"+session.getAttribute("patient_id")+"'";
                            Statement stAppthist = con.createStatement();
                            ResultSet rsAppthist;
                            rsAppthist = stAppthist.executeQuery(appt_hist);
                                    while (rsAppthist.next())
                            {num++;
                                %>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                      <thead class="text-primary">
                                          <tr>
                                            <th>#</th>
                                            <th>Patient Name</th>
                                            <th>Doctor</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            %>
                                            <td><%=num%></td>
                                <td><%=rsAppthist.getString("dName")%></td>
                                <td><%=rsAppthist.getString("date")%></td>
                                <td><% 
                                        if (rsAppthist.getString("status").equals("Pending"))
                                        {
                                        %><!--<input type="button" name="view" class="btn btn-warning btn-block text-primary" style="color: #149063 " value=" Pending " >
                                        --><span class="btn btn-warning btn-block " style="color: #fff "> Pending </span>
                                        <%
                                        }
                                        else if (rsAppthist.getString("status").equals("Finished"))
                                        {
                                            %><span class="btn btn-success btn-block " style="color: #fff "> Finished </span><%
                                        }
                                        else if (rsAppthist.getString("status").equals("Cancelled"))
                                        {
                                            %><span class="btn btn-danger btn-block " style="color: #fff "> Cancelled </span><%
                                        }
                                    
                                    %></td>
                                        </tbody>
                                    </table>
                                </div>
                        
                        <%
                            }
                            
                        %>
                            
    <div class="modal fade" id="final_diagnosis" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          
          <form action="doctor_update_diagnosis_process" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update Final Diagnosis</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
            
        
        <p><label for="initial_diagnosis">Final Diagnosis : </label>
                                    <textarea class="form-control inpt" style="resize: none;" type = "text" name = "initial_diagnosis" id="initial_diagnosis" rows="8" required><%=rsAppt.getString("dRemarks")%></textarea></p>
                                <br>
        Enter Password for Confirmation: 
        <input id="password" name="password" class="form-control inpt" id="focusedInput" type="password" placeholder="Password" required>
        </div>
        <div class="modal-footer">
             <script>
                                function ClearFields() {

                                document.getElementById("password").value = "";
                                }
                            </script>
          <button class="btn btn-secondary btnedit" type="button" data-dismiss="modal" onclick = "ClearFields();" >Cancel</button>
          <button class="btn btn-primary btnedit" type="submit" name="logout_confirm">Save</button>
        </div>
        </form>
      </div>
    </div>
  </div>        
                            <%

                            }
                            %>
                            </div></div>      
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
      <%session.setAttribute("edit_message","");
      session.setAttribute("edit_message_error","");
      %>
    }
    </script>
  
  <!-- Bootstrap core JavaScript-->
  <script src="jquery.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    <script src="jquery.dataTables.min.js"></script>
    <script src="dataTables.bootstrap4.min.js"></script>
    <script src="datatables-demo.js"></script>

</body>
    
</html>
