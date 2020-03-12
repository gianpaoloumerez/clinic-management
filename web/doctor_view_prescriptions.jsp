<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

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
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-file-image-o" aria-hidden="true"></i> Manage Prescriptions</h1>
          
          <!--<div class="row">
    
    <div class="col-sm-12 col-md-2">
        <div class="dataTables_length" id="dataTable_length">
            
        </div>
    </div>
    <div class="col-sm-12 col-md-5">
        <p>&nbsp </p>
    </div>
    <div class="col-sm-12 col-md-5">
        <div id="dataTable_filter" class="dataTables_filter">
            <div class="row">
                Search: &nbsp<input type="text" onkeyup="search_filter()" style ="width: 85%" id ="search_bar"class="form-control form-control-sm inpt" placeholder="Search Patient Name" aria-controls="dataTable">
            </div>
        </div>
    </div>
</div>-->
            <div class="row">
                
                
                <div class="col-xs-12 col-sm-12 col-md-12 col-xl-12">
                    <div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-file-image-o" aria-hidden="true"></i> View Prescriptions</h5>
         </div>
     </div>
                       
    <div class="card-body">
            
            <div id="dataTable_filter" class="dataTables_filter">
           
            </div>
        
              <div class="table-responsive">
                    
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead class="text-primary">
                      <tr>
                        <th>#</th>
                        <th>Date</th>
                        <th>Patient</th>
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
                        rsPatient = stPatient.executeQuery("select * from prescription join patient on prescription.patient_num = patient.count where prescription.doctor_num = '"+session.getAttribute("doctorID")+"' and archive = 'no' order by prescription.date desc");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {
                            num++;
                            %><tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("prescription.date")%></td>
                                <td><%=rsPatient.getString("patient.name")%></td>
                               
                                <td><form target="_blank" action="file_download" method="post">
                                    <input type="hidden" name="presc_id" id="patient_id" value="<%=rsPatient.getString("prescription.id")%>">
                                    <!--<input type="button" name="view" class="btn btn-color btn-block text-primary" data-toggle="modal" data-target="#prescription_view" value=" Download ">
                                    <input type="submit" name="view" class="btn btn-color btn-block text-primary" value=" View ">
                                    -->
                                    <button type="submit" name="view" class="btn btn-color btn-block text-primary"> <i class="fa fa-external-link" aria-hidden="true"></i> View </button>
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
                    <script>
        function search_filter() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("search_bar");
          filter = input.value.toUpperCase();
          table = document.getElementById("dataTable");
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
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
