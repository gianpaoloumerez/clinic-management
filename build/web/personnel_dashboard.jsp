<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_personnel.jsp" %>
<%session.setAttribute("transaction","appointment");%>
<%session.setAttribute("from_patient_profile","false");%>
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
    
    <!--<body id="page-top" onbeforeunload = "dateilsReset();">-->
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
          
          <span><a class="h3 mb-4 text-gray-800"> <i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Select Patient </a><a class = "h5">/ Set Appointment</a></span> 
          
          <br><br>
          <h3 style="color: #d62516"><% try {if(session.getAttribute("appointment_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("appointment_message"));}} catch (Exception e) {out.print(" ");}%></h3>
          <h3 style="color: #1cc88a"><% try {if(session.getAttribute("appointment_success").equals(null)){out.print(" ");} else {out.print(session.getAttribute("appointment_success"));}} catch (Exception e) {out.print(" ");}%></h3>
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
                        <p><h5>&nbsp; Birthdate: &nbsp; <% try {if(session.getAttribute("patient_bd").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_bd"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Age: &nbsp; <% try {if(session.getAttribute("patient_age").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_age"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Sex: &nbsp; <% try {if(session.getAttribute("patient_sex").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_sex"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Address: &nbsp; <% try {if(session.getAttribute("patient_addr").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_addr"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Telephone: &nbsp; <% try {if(session.getAttribute("patient_tp").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_tp"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p><h5>&nbsp; Mobile: &nbsp; <% try {if(session.getAttribute("patient_mobile").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_mobile"));}} catch (Exception e) {out.print(" ");}%></h5></p>
                        <p>&nbsp; Last Updated: &nbsp; <% try {if(session.getAttribute("patient_du").equals(null)){out.print(" ");} else {out.print(session.getAttribute("patient_du"));}} catch (Exception e) {out.print(" ");}%></p>
                    
                    </div>
                </div>
                 <a class="btn btn-primary btn-user btn-block btnedit" href="personnel_select_doctor.jsp"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> &nbsp;Next</a>
                 <br>        
              </div>
              
              
              
              <div class="col-sm-12 col-md-12 col-xl-6">
   <div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
           <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-list-alt" aria-hidden="true"></i> Select Patient</h5>
         </div>
     </div>
    <div class="card-body">
            
            <!--<div id="dataTable_filter" class="dataTables_filter">
            <div class="row">
                &nbsp; &nbsp; Search: &nbsp;<input type="text" onkeyup="search_filter()" style ="width: 85%" id ="search_bar"class="form-control form-control-sm inpt" placeholder="Search Name" aria-controls="dataTable">
            </div>
        </div>-->
              <div class="table-responsive">
                    
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead class="text-primary">
                      <tr>
                        <th>#</th>
                        <th>Name</th>
                        <!--<th>Birthdate</th>-->
                        <th>Sex</th>
                        <!--<th>Address</th>
                        <th>Mobile</th>
                        <th>Telephone</th>
                        <th>Last Updated on</th>-->
                        <th> </th>
                    </tr>
                </thead>
                  
                <tbody>
                    <%@ include file="connector.jsp" %>
                    <%@page import="java.sql.*"%>
                    
                    <%    Integer num = 0;                        
                        Statement stPatient = con.createStatement();
                        ResultSet rsPatient;
                        rsPatient = stPatient.executeQuery("select count, name,birthday, gender, address, phone, tphone, date_updated from patient where acct_status = 'active' order by name");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {
                            num++;
                            %><tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("name")%></td>
                                <!--<td><%=rsPatient.getString("birthday")%></td>-->
                                <td><%=rsPatient.getString("gender")%></td>
                                <!--<td><%=rsPatient.getString("address")%></td>
                                <td>+63<%=rsPatient.getString("phone")%></td>
                                <td><%=rsPatient.getString("tphone")%></td>
                                <td><%=rsPatient.getString("date_updated")%></td>-->
                                <td><form action="appointment_patient_details.jsp" method="post">
                                    <input type="hidden" name="patient_id" id="patient_id" value="<%=rsPatient.getString("count")%>">
                                    <button type="submit" name ="view" class="btn btn-color btn-block text-primary"><i class="fa fa-check-square-o" aria-hidden="true"></i> Select</button>
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
              
              <div class="col-sm-12 col-md-12 col-xl-1">
                  <p></p>
              </div>
              
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
      <script>
        function search_filter() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("search_bar");
          filter = input.value.toUpperCase();
          table = document.getElementById("dataTable");
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
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
      <%
            session.setAttribute("appointment_message","");
            session.setAttribute("appointment_success","");
      %>
    }
    </script>
  
    <script src="jquery.dataTables.min.js"></script>
    <script src="dataTables.bootstrap4.min.js"></script>
    <script src="datatables-demo.js"></script>
    
</body>
    
</html>
