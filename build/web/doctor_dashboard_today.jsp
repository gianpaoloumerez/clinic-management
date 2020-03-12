<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page import="java.util.Objects"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_doctor.jsp" %>
<%session.setAttribute("return_address","doctor_dashboard_today.jsp");%>
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
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-calendar" aria-hidden="true"></i> Appointments Today</h1>
          
          <!--<div class="row">
          <div class="col-sm-12 col-md-7">
              <div class = "row">
                  <label for="name_bar" style="font-size: 25px">&nbsp; &nbsp; Search Patient: &nbsp;</label>
                  <input type="text" onkeyup="name_filter()" style ="width: 65%; height: 40px" id ="name_bar" name ="name_bar" class="form-control form-control-sm inpt" placeholder="Search Patient Name" aria-controls="dataTable">
              </div>
          </div>
          <div class="col-sm-12 col-md-5">
        <div id="dataTable_filter" class="dataTables_filter">
            <div class="row">
                <!--<label for="search_bar" style="font-size: 25px">&nbsp; &nbsp; Select Date: &nbsp;</label>
                <input type="date" onchange="search_filter()" style ="width: 40%; height: 40px" id ="search_bar" name ="search_bar" class="form-control form-control-sm inpt" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" placeholder="Choose Date" aria-controls="dataTable">
                &nbsp; &nbsp; &nbsp;<a class ="btn btn-block btn-secondary inpt" style ="width: 20%; height: 40px; color: #fff" href="doctor_dashboard.jsp" >View All</a>
            </div>
        </div>
          </div>
    </div>-->
          <br>
<div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
            <div class="col-sm-12 col-md-4">
                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-list-alt" aria-hidden="true"></i> Appointments Today </h5></div>
                <div class="col-sm-12 col-md-5">
                    
                </div>
                <div class="col-sm-12 col-md-3">
                    <div class ="row">
                    <label for="status_bar" class="m-0 font-weight-bold">&nbsp; &nbsp; Select Status:  &nbsp</label>
                    <select  class="form-control form-control-sm inpt" onchange="status_filter()" style ="width: 50%" id = "status_bar" name="status_bar" required>
                        <option>Show All</option>
                        <option>Pending</option>
                        <option>Finished</option>
                        <option>Cancelled</option>
                    </select>
                    </div>
                </div>
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
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
               
                <tbody>
                    <%@ include file="connector.jsp" %>
                    <%@page import="java.sql.*"%>
                    <%
                        Integer num = 0;    
                        Date currentdate = new Date();
                        DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                        String cdate =DFormat.format(currentdate);
                        
                        session.setAttribute("from_appointment", "false");                           
                        Statement stPatient = con.createStatement();
                        ResultSet rsPatient;
                        rsPatient = stPatient.executeQuery("select count, date, pNum, dName, dNum, pName, status from appointment where dNum = '"+session.getAttribute("doctorID")+"' and date = '"+cdate+"' order by count");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {
                            num++;
                            %>
                            <%

                            %>
                            <tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("pName")%></td>
                                <td><%=rsPatient.getString("dName")%></td>
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
                                <td><form action="appointment_id.jsp" method="post">
                                    
                                    <input type="hidden" name="patient_id" id="patient_id" value="<%=rsPatient.getString("pNum")%>">
                                    <input type="hidden" name="appt_id" id="appt_id" value="<%=rsPatient.getString("count")%>">
                                    <!--<input type="submit" name="view" class="btn btn-color btn-block text-primary" onclick="view_patient();" value=" View ">
                                    -->
                                    <button type="submit" name="view" class="btn btn-color btn-block text-primary" onclick="view_patient();"> <i class="fa fa-external-link" aria-hidden="true"></i> View </button>
                                    
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
        
        function name_filter() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("name_bar");
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
        
        function status_filter() 
        {
        var input, filter, table, tr, td, i;
        input = document.getElementById("status_bar");
        filter = input.value.toUpperCase();
        table = document.getElementById("dataTable");
        tr = table.getElementsByTagName("tr");
        
        if (filter == "SHOW ALL")
        {
            for (i = 0; i < tr.length; i++) 
            {
                td = tr[i].getElementsByTagName("td")[5];
                if (td) 
                {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) 
                    {
                      tr[i].style.display = "none";
                    } 
                    else 
                    {
                      tr[i].style.display = "";
                    }
                }       
            }
        }
        else
        {
            for (i = 0; i < tr.length; i++) 
            {
                td = tr[i].getElementsByTagName("td")[5];
                if (td) 
                {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) 
                    {
                      tr[i].style.display = "";
                    } 
                    else 
                    {
                      tr[i].style.display = "none";
                    }
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
