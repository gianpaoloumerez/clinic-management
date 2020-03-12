<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_admin.jsp" %>
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
        
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        
        
        <link href="sb-admin-2.css" rel="stylesheet">
        
        <title>CMS</title>
    </head>
    
    
    
    <body id="page-top">
        
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="admin_sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <%@ include file="admin_topbar.jsp" %>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

            
            
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-book" aria-hidden="true"></i> Accounts Activity Log </h1>
          <br>
          <div class="row">
          <div class="col-sm-12 col-md-2">
             <button name="download" class="btn btn-primary btn-user btn-block btnedit" onclick ="printData();" id = "download" ><i class="fa fa-print" aria-hidden="true"></i> Print Log</button>
          </div>
              <div class="col-sm-12 col-md-6">
                  <p></p>
              </div>
          <div class="col-sm-12 col-md-4">
        <div id="dataTable_filter" class="dataTables_filter">
            <div class="row">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label for="search_bar" style="font-size: 25px">Select Date: &nbsp;</label>
                <input type="date" onchange="search_filter()" style ="width: 50%; height: 40px" id ="search_bar" name ="search_bar" class="form-control form-control-sm inpt" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" placeholder="Choose Date" aria-controls="dataTable">

            </div>
        </div>
          </div>
    </div>
          <br>
<div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
            <div class="col-sm-12 col-md-4">
                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-book" aria-hidden="true"></i> Logs </h5></div>
                <div class="col-sm-12 col-md-5"></div>
                </div>
        </div>
    <div class="card-body">
              <div class="table-responsive" id = "log_table" style ="font-family: sans-serif">
                  <%@page import="java.util.Date"%>
                    <%@page import="java.text.DateFormat"%>
                    <%@page import="java.text.SimpleDateFormat"%>
                    <%
                    Date currentdate = new Date();
                    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String cdate =DFormat.format(currentdate);
                    %>
                    <p><h4 style ="color: #000"><center>Clinic Management System Activity Log</center></h4></p>
                    <p><center><%=cdate%></center></p>
                <table class="table table-bordered" border="1" cellpadding="3" id="table_log" width="100%" cellspacing="0">
                  <thead class="text-primary">
                      <tr>
                        <th>#</th>
                        <th>Account</th>
                        <th>Username</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Action</th>
                        <th>Description</th>
                    </tr>
                </thead>
                  
                <tbody>
                    <%@ include file="connector.jsp" %>
                    <%@page import="java.sql.*"%>
                    <%  
                        Integer num = 0;    
                        Statement stPatient = con.createStatement();
                        ResultSet rsPatient;
                        rsPatient = stPatient.executeQuery("select * from log order by date desc");
                        while (rsPatient.next())
                        {
                            num++;
                            %>
                            <tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("acct_type")%></td>
                                <td><%=rsPatient.getString("username")%></td>
                                <td><%=rsPatient.getString("date")%></td>
                                <td><%=rsPatient.getString("time")%></td>
                                <td><%=rsPatient.getString("change_type")%></td>
                                <td style="text-align: center"><%=rsPatient.getString("description")%></td>
                                 
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

<script>
        function search_filter() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("search_bar");
          filter = input.value.toUpperCase();
          table = document.getElementById("table_log");
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

<script>
function printData()
{
    var divToPrint=document.getElementById("log_table");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}
</script> 
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
