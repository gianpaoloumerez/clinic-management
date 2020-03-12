<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_personnel.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
  <form action="file_upload" method="post" enctype="multipart/form-data">
        
        <!-- Topbar -->
        <%@ include file="personnel_topbar.jsp" %>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid center">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-calendar" aria-hidden="true"></i> View Appointment Details</h1>
          <h4 style="color: #1cc88a"><p><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></p></h4>
          <h4 style="color: #be2617"><p><% try {if(session.getAttribute("edit_message_error").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message_error"));}} catch (Exception e) {out.print(" ");}%></p></h4>
              
          <div class="row">
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                    
                    
                            <%@ include file="connector.jsp" %>
                            <%@page import="java.sql.*"%>
                            <%
                            DateFormat DFormatlog = new SimpleDateFormat("H:mm");
                            
                            String view_patient =  "select * from appointment where count = '"+session.getAttribute("appointment_id")+"'";
                            Statement stPatient = con.createStatement();
                            ResultSet rsPatient;
                            //rsPatient = stPatient.executeQuery("select count, name, age, birthday, gender, address, phone, tphone, date_updated from patient where acct_status = 'active'");
                            rsPatient = stPatient.executeQuery(view_patient);
                            while (rsPatient.next())
                            {
                                String sched_time = rsPatient.getString("time");
                            Integer hour = Integer.parseInt(sched_time.substring(0, 2));
                            Integer min = Integer.parseInt(sched_time.substring(4, 5));
                            String time_display="";
                            
                            if (hour > 12)
                            {
                                hour = hour - 12;
                                if (min == 0)
                                {time_display = hour +":0"+min+" PM";}
                                else
                                {time_display = hour +":"+min+" PM";}
                            }
                            else if (hour < 12)
                            {
                                if (min == 0)
                                {time_display = hour +":0"+min+" AM";}
                                else
                                {time_display = hour +":"+min+" AM";}
                            }
                                
                            //String time_sched = rsPatient.getString("time").toString();
                            //Date sched_time = DFormatlog.parse(time_sched);
                            %>
                            
                            <p><a class="btn btn-secondary btn-user btn-block btnbck" href="<%=session.getAttribute("return_address").toString()%>"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                                    <p><a class="btn btn-primary btn-user btn-block btnedit" href="personnel_edit_appointment.jsp"> &nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update Details</a>
                                    <p><a class="btn btn-primary btn-success btn-user btn-block btnedit" href="" data-toggle="modal" data-target="#upload_presc"> &nbsp;<i class="fa fa-file-image-o" aria-hidden="true"></i> Upload Prescription</a>
                                    <p><a class="btn btn-primary btn-info btn-user btn-block btnedit" href="personnel_view_patient.jsp"> &nbsp;<i class="fa fa-user-circle" aria-hidden="true"></i> View Patient</a>
                
                </div>
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-8 add_patient">
                    <div class="row">
                          
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                            <br>
                            <p>Scheduled Date : <input id="appt_date" name="appt_date" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("date")%>'disabled></p><%
                                %><p>Scheduled Time : <input id="appt_time" name="appt_time" class="form-control inpt" id="focusedInput" type="text" value = '<%=time_display%>'disabled></p><%
                                %><p>Patient : <input id="appt_patient" name="appt_patient" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("pName")%>'disabled></p><%
                                %><p>Doctor :<input id="appt_doctor" name="appt_doctor" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsPatient.getString("dName")%>'disabled></p><%
                                %>
                                <br>
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-5">
                                <br> 
                                <p>Initial Diagnosis : <textarea id="appt_init_diag" name="appt_init_diag" class="form-control inpt" id="focusedInput" rows="6" style="resize: none;" disabled><%=rsPatient.getString("rRemarks")%></textarea></p>
                                <br>
                                <p>Final Diagnosis : <textarea id="appt_init_diag" name="appt_init_diag" class="form-control inpt" id="focusedInput" rows="6" style="resize: none;"disabled><%=rsPatient.getString("dRemarks")%></textarea></p>
                                
                            <%
                                if (rsPatient.getString("status").equals("Finished"))
                                {
                            %><br><p>Appointment Status : <br><input type = "button" class = "btn btn-user btn-block btn-success" Style ="color: #fff; height: 60px; border-radius: 40px 40px 40px 40px; font-size: 25px" value="Finished" disable></p>
                                    <%
                                }
                                else if (rsPatient.getString("status").equals("Pending"))
                                {
                                    %><p>Appointment Status : <br><input type = "button" class = "btn btn-user btn-block btn-warning" Style =" color: #fff; height: 60px; border-radius: 40px 40px 40px 40px; font-size: 25px" value="Pending"></p>
                                    <%
                                }
                                else if (rsPatient.getString("status").equals("Cancelled"))
                                {
                                    %><p>Appointment Status : <br><input type = "button" class = "btn btn-user btn-block btn-danger" Style =" color: #fff; height: 60px; border-radius: 40px 40px 40px 40px; font-size: 25px" value="Cancelled"></p>
                                    <%
                                }
                            }
                            %>
                            <br>
                            
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                    </div>
                </div>  
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                </div>
            </div>
          
        </div>
    <div class="modal fade" id="upload_presc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-file-image-o" aria-hidden="true"></i> Upload Prescritpion</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
            Choose File to Upload: <br>
        <div class="custom-file inpt">
            <input type="file" class="custom-file-input inpt" id="customFile" name="prescription" accept="image/*">
            <label class="custom-file-label" for="customFile">Choose file</label>
        </div>
            <br><br>
            <img id="prescription_preview" src="#" alt="Prescription Preview" width="450"/>
            <br><br>
        <script>
        $(".custom-file-input").on("change", function() {
          var fileName = $(this).val().split("\\").pop();
          $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
        </script>
        <script>
                function readURL(input) {
                if (input.files && input.files[0]) {
                  var reader = new FileReader();

                  reader.onload = function(e) {
                    $('#prescription_preview').attr('src', e.target.result);
                  }

                  reader.readAsDataURL(input.files[0]);
                }
              }

              $("#customFile").change(function() {
                readURL(this);
              });
        </script>
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
        
      </div>
    </div>
  </div>
        <!-- /.container-fluid -->
</form>
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
      <%
          session.setAttribute("edit_message","");
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

</body>
    
</html>
