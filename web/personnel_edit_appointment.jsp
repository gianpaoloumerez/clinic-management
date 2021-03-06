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
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-calendar" aria-hidden="true"></i> Edit Appointment Details</h1>
          
            <div class="row">
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                    
                    
                            <%@ include file="connector.jsp" %>
                            <%@page import="java.sql.*"%>
                            <%
                            String view_patient =  "select * from appointment where count = '"+session.getAttribute("appointment_id")+"'";
                            Statement stPatient = con.createStatement();
                            ResultSet rsPatient;
                            //rsPatient = stPatient.executeQuery("select count, name, age, birthday, gender, address, phone, tphone, date_updated from patient where acct_status = 'active'");
                            rsPatient = stPatient.executeQuery(view_patient);
                            while (rsPatient.next())
                            {%>
                            
                            <p><a class="btn btn-secondary btn-user btn-block btnbck" href="personnel_view_appointment.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                                    
                </div>
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-8 add_patient">
                 <form action="personel_edit_appointment_process" method="post">   
                    <div class="row">
                          
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                            
                            <br>
                                Patient :<h3><%=rsPatient.getString("pName")%></h3>
                                Doctor :<h5><%=rsPatient.getString("dName")%></h5><br>
                                Patients Weight :<div class ="row" style="font-size: 20px">  &nbsp; &nbsp;<input id="patient_weight" name="weight" class="form-control inpt" id="focusedInput" type="text" placeholder="e.g. 60" style =" width:75%" value = '<%=rsPatient.getString("weight")%>' required>&nbsp; Kg</div><br>
                                Patients Height : <div class ="row" style="font-size: 20px">&nbsp; &nbsp; <input id="patient_height" name="height" class="form-control inpt" id="focusedInput" type="text" placeholder="e.g. 1.70" style =" width:75%" value = '<%=rsPatient.getString("height")%>' required> &nbsp; M</div><br>
                                Patient Blood Pressure : <div class ="row" style="font-size: 20px"> &nbsp; &nbsp;<input id="patient_age" name="bp1" class="form-control inpt" pattern="[0-9]{8,1}" style =" width:40%" id="focusedInput" type="number"  value = '<%=rsPatient.getString("bp1")%>' required> &nbsp/&nbsp <input id="patient_age" name="bp2" class="form-control inpt" pattern="[0-9]{8,1}" style =" width:40%"id="focusedInput" type="number" value = '<%=rsPatient.getString("bp2")%>' required>
                                </div>
                                <br>
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-5">
                                <br> 
                                <p><label for="initial_diagnosis">Initial Diagnosis : </label>
                                    <textarea class="form-control inpt" style="resize: none;" type = "text" name = "initial_diagnosis" id="initial_diagnosis" rows="6" required><%=rsPatient.getString("rRemarks")%></textarea></p>
                                <br>
                            <%
                                if (rsPatient.getString("status").equals("Finished"))
                                {
                            %><p>Appointment Status : <select class="form-control inpt" name = "appt_status" required>
                                        <option> Finished </option>
                                        <option> Pending </option>
                                        <option> Cancelled </option>
                                      </select></p><%
                                }
                                else if (rsPatient.getString("status").equals("Pending"))
                                {
                                    %><p>Appointment Status : <select class="form-control inpt" name = "appt_status" required>
                                        <option> Pending </option>
                                        <option> Finished </option>
                                        <option> Cancelled </option>
                                      </select></p><%
                                }
                                else if (rsPatient.getString("status").equals("Cancelled"))
                                {
                                    %><p>Appointment Status : <select class="form-control inpt" name = "appt_status" required>
                                        <option> Cancelled </option>
                                        <option> Pending </option>
                                        <option> Finished </option>
                                      </select></p><%
                                }
                            }
                            %>
                            <br>
                            <p><input type="button" name="submit_confirm" class="btn btn-primary btn-user btn-block btnadd"  data-toggle="modal" data-target="#confirm_modal" value="  Save Changes "></p>
                            <br>
                            <h4><center><p><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></p></center></h4>
                            
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
                            
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                    </div>
                 </form>
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
