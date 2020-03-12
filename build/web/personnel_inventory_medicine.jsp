<%-- 
    Document   : admin_dashboard
    Created on : Jan 16, 2020, 3:42:20 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_personnel.jsp" %>
<% session.setAttribute ("item_type", "medical");%>
<% session.setAttribute ("return_address", "personnel_inventory_medicine.jsp");%>

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
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-list-alt" aria-hidden="true"></i> Manage Inventory</h1>
          
          <div class="row">
    
    <div class="col-sm-12 col-md-2">
        <button name="add_item" class="btn btn-success btn-user btn-block btnedit" id = "add_item" data-toggle="modal" data-target="#add_item_modal"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Add Item</button>
          
    </div>
    <div class="col-sm-12 col-md-5">
        <p>&nbsp </p>
    </div>
    <div class="col-sm-12 col-md-5">
        <!--<div id="dataTable_filter" class="dataTables_filter">
            <div class="row">
                <label for="search_bar" style="font-size: 25px">Search : &nbsp;</label>
                <input type="text" onkeyup="search_filter()" style ="width: 75%; height: 40px" id ="search_bar"class="form-control form-control-sm inpt" placeholder="Search Item Name" aria-controls="dataTable">
            </div>
        </div>-->
    </div>
</div>
          <br>
            <div class="row">
                
                
                <div class="col-xs-12 col-sm-12 col-md-12 col-xl-12">
                    <div class="card shadow mb-4 cardcustom">
    
    <div class=" py-3 tablebg">
        <div class ="row">
           <div class="col-sm-12 col-md-4">
                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-medkit" aria-hidden="true"></i> Medical Items</h5></div>
                <div class="col-sm-12 col-md-5"></div>
                <div class="col-sm-12 col-md-3"><h6 class="m-0 font-weight-bold" Style = "text-align: center" >&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="personnel_inventory_medicine_archive.jsp" style="color: #fff"> <i class="fa fa-archive" aria-hidden="true"></i> View Archive</a></center></h6>
            </div>
        </div>
     </div>
                       
    <div class="card-body">
            
            <div id="dataTable_filter" class="dataTables_filter">
                <h4><p><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></p></h4>
             </div>
            
              <div class="table-responsive">
                    
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead class="text-primary">
                      <tr>
                        <th>#</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Date Added</th>
                        <th>Updated On</th>
                        <th> </th>
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
                        rsPatient = stPatient.executeQuery("select * from inventory where item_type = 'medicine' and archive = 'no' order by item_name");
                        //rsPatient = stPatient.executeQuery("select * from patient");
                        while (rsPatient.next())
                        {
                            num++;
                            %><tr>
                                <td><%=num%></td>
                                <td><%=rsPatient.getString("item_name")%></td>
                                <td><%=rsPatient.getString("quantity")%></td>
                                <td><%=rsPatient.getString("date_added")%></td>
                                <td><%=rsPatient.getString("date_updated")%></td>
                                
                                <td><form action="edit_item" method="post">
                                    <input type="hidden" name="inventory_id" id="inventory_id" value="<%=rsPatient.getString("id")%>">
                                    <button type="button" name="edit" class="btn btn-color btn-block text-primary" data-toggle="modal" data-target="#edit_item_modal<%=rsPatient.getString("id")%>"> <i class="fa fa-edit" aria-hidden="true"></i> Edit </button>
                                    
                                    <div class="modal fade" id="edit_item_modal<%=rsPatient.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                          <div class="modal-content">
                                            <div class="modal-header">
                                              <h5 class="modal-title" id="exampleModalLabel">Edit Item</h5>
                                              <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                              </button>
                                            </div>
                                                <div class="modal-body">
                                                    Item Name:
                                                    <input id="item_name" name="item_name" class="form-control inpt" id="focusedInput" type="text" value=<%=rsPatient.getString("item_name")%> required></p>
                                                    Quantity: 
                                                    <input id="quantity" name="quantity" class="form-control inpt" id="focusedInput" type="number" value=<%=rsPatient.getString("quantity")%> required></p>
                                                </div>
                                                <div class="modal-body">
                                                    Password for Confirmation: 
                                                    <input id="password" name="password" class="form-control inpt" id="focusedInput" type="password" placeholder="Password"></p>

                                                </div>
                                                <div class="modal-footer">
                                                  <button class="btn btn-secondary btnedit" type="button" data-dismiss="modal">Cancel</button>
                                                  <button class="btn btn-success btnedit" type="submit" name="logout_confirm">Save Changes</button>

                                                </div>
                                          </div>
                                        </div>
                                      </div>
                                    
                                    </form>
                                </td>  
                                <td>
                                    <form action="remove_item" method="post">
                                    <input type="hidden" name="inventory_id" id="inventory_id" value="<%=rsPatient.getString("id")%>">
                                    <input type="hidden" name="item_name" id="inventory_id" value="<%=rsPatient.getString("item_name")%>">
                                    <button type="button" name="view" class="btn btn-color btn-block text-danger" data-toggle="modal" data-target="#confirm_modal<%=rsPatient.getString("id")%>"> <i class="fa fa-trash-o" aria-hidden="true"></i> Remove </button>
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
                                                <script>
                                                    function ClearFields() {

                                                    document.getElementById("password").value = "";
                                                    }
                                                    </script>
                                                <input type="submit" class="btn btn-primary" value="Confirm">
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
    <script>
        function ClearFields() 
        {
        document.getElementById("item_name").value = "";
        document.getElementById("quantity").value = "";
        document.getElementById("password").value = "";
        }
        
    </script>
    
    <div class="modal fade" id="add_item_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add Item</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick = "ClearFields();">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form action="add_item" method="post">
            <div class="modal-body">
                Item Name:
                <input id="item_name" name="item_name" class="form-control inpt" id="focusedInput" type="text" placeholder="Item Name" required></p>
                Quantity: 
                <input id="quantity" name="quantity" class="form-control inpt" id="focusedInput" type="number" placeholder="Quantity of Item" required></p>
            </div>
            <div class="modal-body">
                Password for Confirmation: 
                <input id="password" name="password" class="form-control inpt" id="focusedInput" type="password" placeholder="Password"></p>
                                        
            </div>
            <div class="modal-footer">
              <button class="btn btn-secondary btnedit" type="button" data-dismiss="modal" onclick = "ClearFields();">Cancel</button>
              <button class="btn btn-success btnedit" type="submit" name="logout_confirm">Add</button>

            </div>
        </form>
      </div>
    </div>
  </div>
    
    
    
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
