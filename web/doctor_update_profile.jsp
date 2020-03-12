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
	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
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
          <h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update Profile</h1>
          
            <div class="row">
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                    
                    
                            <%@ include file="connector.jsp" %>
                            <%@page import="java.sql.*"%>
                            <%
                            String view_Doctor =  "select * from doctor where count = '"+session.getAttribute("doctorID")+"'";
                            Statement stDoctor = con.createStatement();
                            ResultSet rsDoctor;
                            rsDoctor = stDoctor.executeQuery(view_Doctor);
                            while (rsDoctor.next())
                            {
                                Integer age = 0;
                                        Date currentdate = new Date();
                                        DateFormat Year = new SimpleDateFormat("yyyy");
                                        Integer cy = Integer.parseInt(Year.format(currentdate));
                                        DateFormat month = new SimpleDateFormat("MM");
                                        Integer cm = Integer.parseInt(month.format(currentdate));
                                        DateFormat date = new SimpleDateFormat("dd");
                                        Integer cd = Integer.parseInt(date.format(currentdate));
                                        
                                        Integer by = Integer.parseInt(rsDoctor.getString("birthday").toString().substring(0,4));
                                        Integer bm = Integer.parseInt(rsDoctor.getString("birthday").toString().substring(5,7));
                                        Integer bd = Integer.parseInt(rsDoctor.getString("birthday").toString().substring(8,10));
                                        
                                        if (by == cy)
                                        {
                                            age = 0;
                                        }
                                        else if (by < cy && bm < cm)
                                        {
                                            age = (cy - by);
                                        }
                                        else if (by < cy && bm > cm)
                                        {
                                            age = (cy - by)-1;
                                        }
                                        else if (by < cy && bm == cm && bd > cd)
                                        {
                                            age = (cy - by)-1;
                                        }
                                        else if (by < cy && bm.equals(cm) && bd < cd)
                                        {
                                            age = (cy - by);
                                        }
                                        else if (by < cy && bm == cm && bd.equals(cd))
                                        {
                                            age = (cy - by);
                                        }
                                        else if ( by.equals(cy) && bm < cm)
                                        {
                                            age = 0;
                                        }
                                        else if (by.equals(cy) && bm.equals(cm) && bd < cd)
                                        {
                                            age = 0;
                                        }
                            %>
                </div>
                
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-8 add_patient">
                    
                    <form action="doctor_update_profile_process.jsp" method="post"> 
                    
                        <div class="row">
                          
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                            <br>
                            <p>Name : <input id="patient_name" name="name" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsDoctor.getString("name")%>'></p><%
                                %><p>Birth Date : <input id="patient_bdate" name="bdate" class="form-control inpt" id="focusedInput" type="date" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" value = '<%=rsDoctor.getString("birthday")%>'></p><%
                                %><p>Age : <input id="patient_age" name="age" class="form-control inpt" id="focusedInput" type="text" value = '<%=age%>'disabled></p>
                                <p>Email :<input id="sex" name="email" class="form-control inpt" id="focusedInput" type="email" value = '<%=rsDoctor.getString("email")%>'></p>
                                <p>Telephone : <input id="patient_telephone" name="tel" class="form-control inpt" id="focusedInput" type="text" pattern="[0-9]{8,}" value = '<%=rsDoctor.getString("tphone")%>'></p><%
                                %>Mobile : <div class="row" style =" font-size: 20px"> &nbsp +63 &nbsp <input id="patient_mobile" name="mobile" class="form-control inpt" id="focusedInput" style =" width:75%"value = '<%=rsDoctor.getString("phone")%>'></div>
                                <br>
                                <br>
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                                </div>
                                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                                <br>
                                <p>Address : <input id="patient_address" name="address" class="form-control inpt" id="focusedInput" type="text" value = '<%=rsDoctor.getString("address")%>'></p>
                               <% if (rsDoctor.getString("status").equals("Single"))
                               {
                                %><p>Marital Status : <select class="form-control inpt" name="status" value = '<%=rsDoctor.getString("status")%>' required>
                                        <option selected>Single</option>
                                        <option>Married</option>
                                        <option>Divorced</option>
                                        <option>Separated</option>
                                        <option>Widowed</option>
                                    </select></p><%
                                        
                                } else if (rsDoctor.getString("status").equals("Married"))
                               {
                                %><p>Marital Status : <select class="form-control inpt" name="status" value = '<%=rsDoctor.getString("status")%>' required>
                                        <option>Single</option>
                                        <option selected>Married</option>
                                        <option>Divorced</option>
                                        <option>Separated</option>
                                        <option>Widowed</option>
                                    </select></p><%
                                        
                                } else if (rsDoctor.getString("status").equals("Divorced"))
                               {
                                %><p>Marital Status : <select class="form-control inpt" name="status" value = '<%=rsDoctor.getString("status")%>' required>
                                        <option>Single</option>
                                        <option>Married</option>
                                        <option selected>Divorced</option>
                                        <option>Separated</option>
                                        <option>Widowed</option>
                                    </select></p><%
                                        
                                } else if (rsDoctor.getString("status").equals("Separated"))
                               {
                                %><p>Marital Status : <select class="form-control inpt" name="status" value = '<%=rsDoctor.getString("status")%>' required>
                                        <option>Single</option>
                                        <option>Married</option>
                                        <option>Divorced</option>
                                        <option selected>Separated</option>
                                        <option>Widowed</option>
                                    </select></p><%
                                        
                                } else if (rsDoctor.getString("status").equals("Widowed"))
                               {
                                %><p>Marital Status : <select class="form-control inpt" name="status" value = '<%=rsDoctor.getString("status")%>' required>
                                        <option>Single</option>
                                        <option>Married</option>
                                        <option>Divorced</option>
                                        <option>Separated</option>
                                        <option selected>Widowed</option>
                                    </select></p><%
                                        
                                }
                                %>
                                
                            <%
                            }
                            %>
                            <br>
                            <p><input type="reset" name="submit_confirm" class="btn btn-primary btn-user btn-block btnclr"  value="Restore Details"></p>
                            <p><input type="button" name="submit_confirm" class="btn btn-primary btn-user btn-block btnadd"  data-toggle="modal" data-target="#confirm_modal" value="Save Changes"></p>
                            <h4><center><p><% try {if(session.getAttribute("edit_message").equals(null)){out.print(" ");} else {out.print(session.getAttribute("edit_message"));}} catch (Exception e) {out.print(" ");}%></p></center></h4>
                            
                            
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                    </div>
                
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
