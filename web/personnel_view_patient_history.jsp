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
	
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <link href="dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="sb-admin-2.css" rel="stylesheet">
        
        <title>CMS</title>
    </head>
    
    
    
    <body id="page-top">
        
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
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-calendar" aria-hidden="true"></i> Patient Appointment History</h1>
          
          <div class="row">
          <div class="col-sm-12 col-md-7">
                                    
          </div>
          <div class="col-sm-12 col-md-5">
          </div>
    </div>
          <br>
          <div class ="row">
            <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">  
          <p><a class="btn btn-secondary btn-user btn-block btnbck" href="personnel_view_patient.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
            </div> 
              <div class="col-xs-11 col-sm-11 col-md-11 col-xl-10"> 
<div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
            <div class="col-sm-12 col-md-4">
                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-list-alt" aria-hidden="true"></i> Appointments </h5></div>
                
        </div>
    </div>
    <div class="card-body">
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
                    <%@ include file="connector.jsp" %>
                    <%@page import="java.sql.*"%>
                    <%
                        Integer num = 0;    
                        Statement stPatient = con.createStatement();
                        ResultSet rsPatient;
                        rsPatient = stPatient.executeQuery("select height, weight, bp1, bp2, count, dRemarks, rRemarks, date, pNum, dName, dNum, pName, status from appointment where pNum = '"+session.getAttribute("patient_id")+"' order by date");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {num++;
                            %>
                            <%

                            %>
                            <tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("pName")%></td>
                                <td><%=rsPatient.getString("dName")%></td>
                                <td><%=rsPatient.getString("date")%></td>
                                <td><% 
                                        if (rsPatient.getString("status").equals("Pending"))
                                        {
                                        %><!--<input type="button" name="view" class="btn btn-warning btn-block text-primary" style="color: #149063 " value=" Pending " >
                                        --><span class="btn btn-warning btn-block " style="color: #fff "> Pending </span>
                                        <%
                                        }
                                        else if (rsPatient.getString("status").equals("Finished"))
                                        {
                                            %><span class="btn btn-success btn-block " style="color: #fff "> Finished </span><%
                                        }
                                        else if (rsPatient.getString("status").equals("Cancelled"))
                                        {
                                            %><span class="btn btn-danger btn-block " style="color: #fff "> Cancelled </span><%
                                        }
                                    
                                    %></td>
                                <td>
                                    <!--<input type="button" name="view" class="btn btn-color btn-block text-primary" data-toggle="modal" data-target="#view_diag" value=" View ">
                                    -->
                                    <button type="button" name="view" class="btn btn-color btn-block text-primary" data-toggle="modal" data-target="#view_diag"> <i class="fa fa-external-link" aria-hidden="true"></i> View </button>
                                    
                                    <div class="modal fade" id="view_diag" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-book" aria-hidden="true"></i> <%=rsPatient.getString("date")%></h5>
                                          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                            Patients Weight :<div class ="row" style="font-size: 20px">&nbsp;&nbsp; <input id="patient_weight" name="weight" class="form-control inpt" id="focusedInput" type="text" style =" width:50%" value = '<%=rsPatient.getString("weight")%>'disabled> &nbsp;Kg
                                                            </div>
                                            Patients Height : <div class ="row" style="font-size: 20px">&nbsp;&nbsp; <input id="patient_height" name="height" class="form-control inpt" id="focusedInput" type="text" style =" width:50%" value = '<%=rsPatient.getString("weight")%>'disabled> &nbsp;M
                                                                </div>
                                            Patient Blood Pressure : <div class ="row" style="font-size: 20px"> &nbsp;&nbsp; <input id="patient_age" name="bp1" class="form-control inpt" pattern="[0-9]{8,1}" style =" width:40%" id="focusedInput" type="number" value = '<%=rsPatient.getString("bp1")%>'disabled> &nbsp;/&nbsp; <input id="patient_age" name="bp2" class="form-control inpt" pattern="[0-9]{8,1}" style =" width:40%"id="focusedInput" type="number" value = '<%=rsPatient.getString("bp2")%>'disabled>
                                            </div>  <br>
                                        <p><label for="initial_diagnosis">Initial Diagnosis : </label>
                                                                    <textarea class="form-control inpt" style="resize: none;" type = "text" name = "initial_diagnosis" id="initial_diagnosis" rows="6" required disabled><%=rsPatient.getString("rRemarks")%></textarea></p>

                                        <p><label for="initial_diagnosis">Final Diagnosis : </label>
                                                                    <textarea class="form-control inpt" style="resize: none;" type = "text" name = "initial_diagnosis" id="initial_diagnosis" rows="6" required disabled><%=rsPatient.getString("dRemarks")%></textarea></p>
                                                                <br>
                                        </div>
                                        <div class="modal-footer">

                                          <button class="btn btn-secondary btnedit" type="button" data-dismiss="modal" onclick = "ClearFields();" >Close</button>
                                        </div>
                                      </div>
                                    </div>
  </div>
                                </td>  
                            <%
                        }

                    %>
                    
                </tbody>
                  
                </table>
              </div>
    </div> 
</div></div>
        </div>

        
    <script>
        function search_filter() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("search_bar");
          filter = input.value.toUpperCase();
          table = document.getElementById("dataTable");
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[3];
            if (td) {
              txtValue = td.textContent || td.innerText;
              if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
              } else {
                tr[i].style.display = "none";
              }
            }       
          }
        }
        </script>
        

        
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
  <script src="jquery.dataTables.min.js"></script>
    <script src="dataTables.bootstrap4.min.js"></script>
    <script src="datatables-demo.js"></script>

</body>
    
</html>
