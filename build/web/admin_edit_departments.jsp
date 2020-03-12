<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_admin.jsp" %>
<%@ include file="connector.jsp" %>
<%@page import="java.sql.*"%>
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
        <div class="container-fluid center">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-user-circle-o" aria-hidden="true"></i> Manage Departments</h1>
          
          
<div class="row">
    <div class="col-sm-12 col-md-12 col-xl-1">
        <p></p>
    </div>
    
    <div class="col-sm-12 col-md-12 col-xl-4">
        <div class="card shadow mb-4 cardcustom"> 
            <div class=" py-3 tablebg">
                <div class ="row">
                    <h5 class="m-0 font-weight-bold"> &nbsp; &nbsp; &nbsp; <i class="fa fa-address-card" aria-hidden="true"></i> Department Details</h5>
                </div>
            </div>
            <div class="card-body">
                <h4 style = "color: #000"><%=session.getAttribute("deptName")%> Department </h4>
                <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                    <thead class="text-primary">
                        <tr>
                            <th>#</th>
                            <th>Doctor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Integer Doc_num = 0;                           
                        Statement stDoc = con.createStatement();
                        ResultSet rsDoc;
                        rsDoc = stDoc.executeQuery("select * from doctor where dept = '"+session.getAttribute("deptName").toString()+"'");
                        while (rsDoc.next())
                        {
                            Doc_num++;
                            %>
                                <tr>
                                <td><%=Doc_num%></td>
                                <td><%=rsDoc.getString("name")%></td>
                                </tr>
                        
                        <%
                            
                        }    %>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
                
    <div class="col-xs-12 col-sm-12 col-md-12 col-xl-6">
        <div class="card shadow mb-4 cardcustom">
            <div class=" py-3 tablebg">
                <div class ="row">
                    <div class="col-sm-12 col-md-4">
                        <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-user-circle-o" aria-hidden="true"></i> Departments</h5></div>
                        <div class="col-sm-12 col-md-5">
                            
                        </div>
                        <div class="col-sm-12 col-md-3">
                         </div>     
                </div>
            </div>
                       
        <div class="card-body">
            <div class="row">
                <!--<label for="search_bar" style="font-size: 20px">&nbsp; &nbsp; Search: &nbsp;</label> 
                <input type="text" name ="search_bar" onkeyup="search_filter()" style ="width: 65%; height: 35px" id ="search_bar"class="form-control form-control-sm inpt" placeholder="Search Department" aria-controls="dataTable">
               --> &nbsp; &nbsp; 
                <button class ="btn btn-color btn-success inpt m-0 font-weight-bold" style="color: #fff" data-toggle="modal" data-target="#addDeptModal"><i class="fa fa-plus-square-o" aria-hidden="true"></i> &nbsp;&nbsp;  Add &nbsp;&nbsp; </button>
                        
            </div>
            <div id="dataTable_filter" class="dataTables_filter">
                <h4><p><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></p></h4>
            </div>
            
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead class="text-primary">
                        <tr>
                            <th>#</th>
                            <th>Department</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Integer num = 0;                           
                        Statement stPatient = con.createStatement();
                        ResultSet rsPatient;
                        rsPatient = stPatient.executeQuery("select * from department");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {
                            num++;
                            %><tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("department")%></td>
                                <td><form action="department_name.jsp" method="post">
                                    <input type="hidden" name="dept_id" id="dept_id" value="<%=rsPatient.getString("id")%>">
                                    <input type="hidden" name="dept_name" id="dept_name" value="<%=rsPatient.getString("department")%>">
                                    <!--<input type="submit" name="archive" class="btn btn-color btn-block text-primary" value=" View ">
                                    --><button type="submit" name="archive" class="btn btn-color btn-block text-primary"> <i class="fa fa-external-link" aria-hidden="true"></i> View </button>
                                    </form>
                                </td>        
                                <td><form action="department_remove" method="post">
                                    <input type="hidden" name="dept_id" id="dept_id" value="<%=rsPatient.getString("id")%>">
                                    <input type="hidden" name="dept_name" id="dept_name" value="<%=rsPatient.getString("department")%>">
                                    <!--<input type="submit" name="archive" class="btn btn-color btn-block text-danger" value=" Remove ">
                                    --><button type="button" name="archive" class="btn btn-color btn-block text-danger" data-toggle="modal" data-target="#confirm_modal<%=rsPatient.getString("id")%>"> <i class="fa fa-trash-o" aria-hidden="true"></i> Remove </button>
                                    <div class="modal fade" id="confirm_modal<%=rsPatient.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
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
                                </td>
                            </tr>     
                        <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div> 
    </div>
    
    <script>
        function search_filter() 
        {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("search_bar");
          filter = input.value.toUpperCase();
          table = document.getElementById("dataTable");
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) 
            {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) 
                {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) 
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
    </script>
    
    </div> 
                
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                    
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
        
    <div class="modal fade" id="addDeptModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick = "ClearFields();">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <form action="admin_add_department" method="post">  
                    <div class="modal-body">
                        <input type ="text" id = "department_name" name = "department_name"class ="form-control inpt" placeholder="Department Name" required>
                    </div>
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Password for Confirmation</h5>
                    </div>
                    <div class="modal-body">
                        <input type ="password" id="password" name = "password" class ="form-control inpt" placeholder="Password" required>
                    </div>  
                    <div class="modal-footer">
                        <button class="btn btn-secondary btnedit" type="button" data-dismiss="modal" onclick = "ClearFields();">Cancel</button>
                        <button class="btn btn-success btnedit" type="submit" name="logout_confirm">Add Department</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        function ClearFields() 
        {
            document.getElementById("password").value = "";
            document.getElementById("department_name").value = "";
        }
    </script>
    
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
        <%session.setAttribute("deptName","");%>
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
