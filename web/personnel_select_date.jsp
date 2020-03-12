<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_personnel.jsp" %>
<%
    try
    {
    if (session.getAttribute("appt_doctor_id").equals(""))
    {
        session.setAttribute("appointment_message_doctor", "&#128712 Please Select a Doctor to Continue");
        response.sendRedirect("personnel_select_doctor.jsp");
    }
    }
    catch (Exception e)
    {
        session.setAttribute("appointment_message_doctor", "&#128712 Please Select a Doctor to Continue");
        response.sendRedirect("personnel_select_doctor.jsp");
    }
%>
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
    
    
    
    <body id="page-top" onbeforeunload = "messageReset();">
        
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
        <div class="container-fluid">

          <!-- Page Heading -->
          <span><a class="h3 mb-4 text-gray-800"> <i class="fa fa-file-text" aria-hidden="true"></i> Initial Diagnosis </a><a class = "h5">/ Select Doctor / Select Patient / Set Appointment</a></span> 
          
          <br>
          <h3 style="color: #d62516"><% try {if(session.getAttribute("appointment_message_date").equals(null)){out.print(" ");} else {out.print("<br>"+session.getAttribute("appointment_message_date"));}} catch (Exception e) {out.print(" ");}%></h3>
          <br>
          <div class ="row">
              
           <div class="col-sm-12 col-md-12 col-xl-1">
                  <p></p>
              </div>
              
              <div class="col-sm-12 col-md-12 col-xl-4">
                  <div class="card shadow mb-4 cardcustom"> 
                    <div class=" py-3 tablebg">
                        <div class ="row">
                           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-address-card" aria-hidden="true"></i> Patient Details</h5>
                        </div>
                     </div>
                    <div class="card-body">
                        <p><h4>&nbsp; Name: &nbsp; <% try {if(session.getAttribute("patient_name").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_name"));}} catch (Exception e) {out.print(" ");}%></h4></p>
                        <p><h5>&nbsp; Age: &nbsp; <% try {if(session.getAttribute("patient_age").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_age"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Sex: &nbsp; <% try {if(session.getAttribute("patient_sex").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_sex"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                    </div>
                </div>
                <div class="card shadow mb-4 cardcustom"> 
                    <div class=" py-3 tablebg">
                        <div class ="row">
                           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-user-md" aria-hidden="true"></i> Doctor Details</h5>
                        </div>
                     </div>
                    <div class="card-body">
                        <p><h4>&nbsp; Name: &nbsp; <% try {if(session.getAttribute("doctor_name").equals(null)){out.print(" ");} else {out.print(session.getAttribute("doctor_name"));}} catch (Exception e) {out.print(" ");}%></h4></p>
                        <p><h5>&nbsp; Department: &nbsp; <% try {if(session.getAttribute("doctor_dept").equals(null)){out.print(" ");} else {out.print(session.getAttribute("doctor_dept"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Age: &nbsp; <% try {if(session.getAttribute("doctor_age").equals(null)){out.print(" ");} else {out.print(session.getAttribute("doctor_age"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Sex: &nbsp; <% try {if(session.getAttribute("doctor_sex").equals(null)){out.print(" ");} else {out.print(session.getAttribute("doctor_sex"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Telephone: &nbsp; <% try {if(session.getAttribute("doctor_tp").equals(null)){out.print(" ");} else {out.print(session.getAttribute("doctor_tp"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Mobile: &nbsp; <% try {if(session.getAttribute("doctor_mobile").equals(null)){out.print(" ");} else {out.print(session.getAttribute("doctor_mobile"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                    </div>
                </div>
                 
                 <br>        
              </div>
              
              
              
              <div class="col-sm-12 col-md-12 col-xl-6">
    <div class="card shadow mb-4 cardcustom">
    
        <div class=" py-3 tablebg">
            <div class ="row">
                <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-file-text" aria-hidden="true"></i> Initial Diagnosis</h5>
             </div>
        </div>

        <div class="card-body">
            
            <form action="appointment_confirm" method="post">
                <div class ="row" style="font-size: 20px"> &nbsp; &nbsp; &nbsp; Patients Weight : &nbsp; &nbsp;<input id="patient_weight" name="weight" class="form-control inpt" id="focusedInput" type="text" placeholder="e.g. 60" style =" width:50%"required>&nbsp; Kg</div><br>
                <div class ="row" style="font-size: 20px"> &nbsp; &nbsp; &nbsp; Patients Height : &nbsp; &nbsp; <input id="patient_height" name="height" class="form-control inpt" id="focusedInput" type="text" placeholder="e.g. 1.70" style =" width:50%" required> &nbsp; M</div><br>
                <div class ="row" style="font-size: 20px"> &nbsp; &nbsp; &nbsp;Patient Blood Pressure : &nbsp &nbsp<input id="patient_age" name="bp1" class="form-control inpt" pattern="[0-9]{8,1}" style =" width:20%" id="focusedInput" type="number"  required> &nbsp/&nbsp <input id="patient_age" name="bp2" class="form-control inpt" pattern="[0-9]{8,1}" style =" width:20%"id="focusedInput" type="number" required>
                </div>
                <p style="font-size: 20px"> &nbsp; &nbsp;Remarks : <br><textarea id="appt_init_diag" name="initial_diagnosis" class="form-control inpt" id="focusedInput" rows="6" style="resize: none;"></textarea></p>
                
                <br>   
                <script>
                    function ClearFields() {

                    document.getElementById("password").value = "";
                    }
                </script>
                            
                <div class="modal fade" id="confirm_modal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel" style="color: #000">Confirmation</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick = "ClearFields();">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body" style="color: #000">
                                Please Enter Your Password to Confirm
                            </div>
                            <div class="modal-body">
                                <input id="password" name="password" class="form-control inpt" id="focusedInput" type="password" placeholder="Password"></p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick = "ClearFields();">Cancel</button>

                                <button class="btn btn-primary" type="submit">Confirm</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </form>
        </div> 
                
    </div>
                    <button class="btn btn-primary btn-user btn-block btnedit" data-toggle="modal" data-target="#confirm_modal" style = "height: 45px"><i class="fa fa-check-circle" aria-hidden="true"></i> &nbsp; Set Appointment</button>
                    <br>
                    <a class="btn btn-secondary btn-user btn-block btnedit" href="personnel_select_doctor.jsp"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i> &nbsp;Go Back</a>
                    <a class="btn btn-secondary btn-user btn-block btnedit btn-warning" href="appointment_cancel.jsp"><i class="fa fa-times-circle" aria-hidden="true"></i> &nbsp;Cancel</a>
                
                
              </div>
              
              <div class="col-sm-12 col-md-12 col-xl-1">
                  <p></p>
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

  <!-- Bootstrap core JavaScript-->
  <script src="jquery.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <script>
    function messageReset() {
      <%session.setAttribute("appointment_message_personnel","");%>
    }
 </script>
  
</body>
    
</html>
