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
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-id-card" aria-hidden="true"></i> View Patient Prescriptions</h1>
          
            <div class="row">
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                    
                    <p><a class="btn btn-secondary btn-user btn-block btnbck" href="personnel_view_patient.jsp"> &nbsp;<i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Go Back</a>
                            
                </div>
                
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-9">
                    <div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-list-alt" aria-hidden="true"></i> View Prescriptions</h5>
         </div>
     </div>
    <div class="card-body">
            
            <div id="dataTable_filter" class="dataTables_filter">
            <div class="row">
            
                
                
            </div>
        </div>
              <div class="table-responsive">
                    
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead class="text-primary">
                      <tr>
                        <th>#</th>
                        <th>Date</th>
                        <th>Doctor</th>
                        <th> </th>
                    </tr>
                </thead>
                  
                <tbody>
                    <%@ include file="connector.jsp" %>
                    <%@page import="java.sql.*"%>
                    <%
                        Integer num = 0;                           
                        Statement stPatient = con.createStatement();
                        ResultSet rsPatient;
                        rsPatient = stPatient.executeQuery("select * from prescription join doctor on prescription.doctor_num = doctor.count where prescription.patient_num = '"+session.getAttribute("patient_id")+"'");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {
                            num++;
                            %><tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("prescription.date")%></td>
                                <td><%=rsPatient.getString("doctor.name")%></td>
                               
                                <td><form target="_blank" action="file_download" method="post">
                                    <input type="hidden" name="presc_id" id="patient_id" value="<%=rsPatient.getString("prescription.id")%>">
                                    <!--<input type="button" name="view" class="btn btn-color btn-block text-primary" data-toggle="modal" data-target="#prescription_view" value=" Download ">
                                    <input type="submit" name="view" class="btn btn-color btn-block text-primary" value=" View ">
                                    --><button type="submit" name="view" class="btn btn-color btn-block text-primary"> <i class="fa fa-external-link" aria-hidden="true"></i> View </button>
                                    
                                    <div class="modal fade" id="prescription_view" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-cogs" aria-hidden="true"></i> Patient Prescription</h5>
                                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                      <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <br>
                                                    <img src="<%=rsPatient.getBlob("prescription.image")%>" width="450"/>
                                                    <br>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    </form>
                                </td>  
                            <%
                        }

                    %>
                    
                </tbody>
                  
                </table>
              </div>
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
  <script src="jquery.dataTables.min.js"></script>
    <script src="dataTables.bootstrap4.min.js"></script>
    <script src="datatables-demo.js"></script>

</body>
    
</html>
