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
<h1 class="h3 mb-4 text-gray-800"> <i class="fa fa-database" aria-hidden="true"></i> Clinic Management System Reports </h1>
<br>
<div class ="row">
    
    <div class="col-sm-12 col-md-3">
        <div class="card shadow mb-4 cardcustom">

            <div class=" py-3 tablebg">
                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-user-md" aria-hidden="true"></i> Doctor </h5>
            </div>
            <div class="card-body">
                
                <%@ include file="connector.jsp" %>
                <%@page import="java.sql.*"%>
                <%
                    Integer total_doctor = 0;
                    Statement Sdoctor_total = con.createStatement();
                    ResultSet Rdoctor_total;
                    Rdoctor_total = Sdoctor_total.executeQuery("select * from doctor");
                    while (Rdoctor_total.next())
                    {
                        total_doctor++;
                    }
                    %>
                    <div class="chart-pie pt-4">
                    <canvas id="doctors"></canvas>
                    </div>
                    <hr class="sidebar-divider">
                    <p><h5><center>Total Number of Doctor Accounts: </center></h5></p><h1 style ="color: #000"><center><%=total_doctor%></center></h1>
                    
                    <%
                    Integer active_doctor = 0;
                    Statement Sactive_doctor = con.createStatement();
                    ResultSet Ractive_doctor;
                    Ractive_doctor = Sactive_doctor.executeQuery("select * from doctor where acct_status = 'active'");
                    while (Ractive_doctor.next())
                    {
                        active_doctor++;
                    }
                    %><!--<span><h3 style ="color: #1cc88a"><center>Active : <%=active_doctor%></center></h3></span>-->
                    <%Integer inactive_doctor = 0;
                    Statement Sinactive_doctor = con.createStatement();
                    ResultSet Rinactive_doctor;
                    Rinactive_doctor = Sinactive_doctor.executeQuery("select * from doctor where acct_status = 'inactive'");
                    while (Rinactive_doctor.next())
                    {
                        inactive_doctor++;
                    }
                    %><!--<span><h3 style ="color: #be2617"><center>Inactive : <%=inactive_doctor%></center></h3></span>-->
                    
                </div> 
        </div>
    </div>
    <div class="col-sm-12 col-md-3">
        <div class="card shadow mb-4 cardcustom">

            <div class=" py-3 tablebg">
               <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-plus-square" aria-hidden="true"></i> Personnel </h5>
            </div>
            <div class="card-body">
                <%
                    Integer total_personnel = 0;
                    Statement Spersonnel_total = con.createStatement();
                    ResultSet Rpersonnel_total;
                    Rpersonnel_total = Spersonnel_total.executeQuery("select * from receptionist");
                    while (Rpersonnel_total.next())
                    {
                        total_personnel++;
                    }
                %>
                <div class="chart-pie pt-4">
                    <canvas id="personnel"></canvas>
                    </div>
                    <hr class="sidebar-divider">
                <p><center><h5>Total Number of Personnel Accounts: </center></h5></p><h1 style = "color: #000"><center><%=total_personnel%></center></h1>
                    
                    <!--<hr class="sidebar-divider">--><%
                    Integer active_personnel = 0;
                    Statement Sactive_personnel = con.createStatement();
                    ResultSet Ractive_personnel;
                    Ractive_personnel = Sactive_personnel.executeQuery("select * from receptionist where acct_status = 'active'");
                    while (Ractive_personnel.next())
                    {
                        active_personnel++;
                    }
                    %><!--<span><h3 style ="color: #1cc88a"><center>Active : <%=active_personnel%></center></h3></span>-->
                    <%Integer inactive_personnel = 0;
                    Statement Sinactive_personnel = con.createStatement();
                    ResultSet Rinactive_personnel;
                    Rinactive_personnel = Sinactive_personnel.executeQuery("select * from receptionist where acct_status = 'inactive'");
                    while (Rinactive_personnel.next())
                    {
                        inactive_personnel++;
                    }
                    %><!--<span><h3 style ="color: #be2617"><center>Inactive : <%=inactive_personnel%></center></h3></span>-->
                    <%
                        
                %>    
            </div> 
        </div>
    </div>
    

    <div class="col-sm-12 col-md-3">
        <div class="card shadow mb-4 cardcustom">

            <div class=" py-3 tablebg">
                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-users" aria-hidden="true"></i> Patients </h5>
            </div>
            
            <div class="card-body">
               <%
                    Integer total_patient = 0;
                    Statement Spatient_total = con.createStatement();
                    ResultSet Rpatient_total;
                    Rpatient_total = Spatient_total.executeQuery("select * from patient");
                    while (Rpatient_total.next())
                    {
                        total_patient++;
                    }
               %>
               <div class="chart-pie pt-4">
                    <canvas id="patients"></canvas>
                    </div>
                    <hr class="sidebar-divider">
               <p><h5><center>Total Number of Patients: </center></h5></p><br><h1 style = "color: #000"><center><%=total_patient%></center></h1>
                    
                    <!--<hr class="sidebar-divider">--><%
                    Integer active_patient = 0;
                    Statement Sactive_patient = con.createStatement();
                    ResultSet Ractive_patient;
                    Ractive_patient = Sactive_patient.executeQuery("select * from patient where acct_status = 'active'");
                    while (Ractive_patient.next())
                    {
                        active_patient++;
                    }
                    %><!--<span><h3 style ="color: #1cc88a"><center>Active : <%=active_patient%></center></h3></span>-->
                    <%Integer inactive_patient = 0;
                    Statement Sinactive_patient = con.createStatement();
                    ResultSet Rinactive_patient;
                    Rinactive_patient = Sinactive_patient.executeQuery("select * from patient where acct_status = 'inactive'");
                    while (Rinactive_patient.next())
                    {
                        inactive_patient++;
                    }
                    %><!--<span><h3 style ="color: #be2617"><center>Inactive : <%=inactive_patient%></center</h3></span>-->
                    <%
                        
                %>    
            </div> 
        </div>
    </div>
            
    <div class="col-sm-12 col-md-3">
        <div class="card shadow mb-4 cardcustom">
            <div class=" py-3 tablebg">
               <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Appointments</h5>
            </div>
            <div class="card-body">
                <%
               Integer total_appt = 0;
               Statement Sappt_total = con.createStatement();
               ResultSet Rappt_total;
               Rpatient_total = Spatient_total.executeQuery("select * from appointment");
               while (Rpatient_total.next())
               {
                   total_appt++;
               }
               %>
               <div class="chart-pie pt-4">
                    <canvas id="appointments"></canvas>
                    </div>
                    <hr class="sidebar-divider">
               <p><h5><center>Total Number of Appointments: </center></h5></p><h1 style ="color: #000"><center><%=total_appt%></center></h1>
                <!--<hr class="sidebar-divider">--><%
               Integer finished_appt = 0;
               Statement Sfinished_appt = con.createStatement();
               ResultSet Rfinished_appt;
               Ractive_patient = Sactive_patient.executeQuery("select * from appointment where status = 'Finished'");
                while (Ractive_patient.next())
                {
                    finished_appt++;
                }
                %><!--<span><h3 style ="color: #1cc88a"><center>Finished : <%=finished_appt%></center></h3></span>-->
                <%Integer pending_appt = 0;
                Statement Spending_appt = con.createStatement();
                ResultSet Rpending_appt;
                Rpending_appt = Spending_appt.executeQuery("select * from appointment where status = 'Pending'");
                while (Rpending_appt.next())
                {
                    pending_appt++;
                }
                %><!--<span><h3 style ="color: #e9aa0b"><center>Pending : <%=pending_appt%></center></h3></span>-->
                <%Integer cancelled_appt = 0;
                Statement Scancelled_appt = con.createStatement();
                ResultSet Rcancelled_appt;
                    Rcancelled_appt = Scancelled_appt.executeQuery("select * from appointment where status = 'Cancelled'");
                    while (Rcancelled_appt.next())
                    {
                        cancelled_appt++;
                    }
                    %><!--<span><h3 style ="color: #be2617"><center>Cancelled : <%=cancelled_appt%></center></h3></span>-->
                </div> 
        </div>
    </div>
    </div>
    <div class ="row">
                    <div class="col-sm-12 col-md-3">
                        <div class="card shadow mb-4 cardcustom">
                            <div class=" py-3 tablebg">
                               <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-file-image-o" aria-hidden="true"></i> Prescriptions </h5>
                            </div>
                            <div class="card-body">
                                <%
                                    Integer total_prescription = 0;
                                    Statement Sprescription_total = con.createStatement();
                                    ResultSet Rprescription_total;
                                    Rprescription_total = Sprescription_total.executeQuery("select * from prescription");
                                    while (Rprescription_total.next())
                                    {
                                        total_prescription++;
                                    }
                                %>
                               <div class="chart-pie pt-4">
                                <canvas id="prescriptions"></canvas>
                                </div>
                                <hr class="sidebar-divider">
                                <p><center><h5>Total Number of Prescriptions Uploaded: </center></h5></p><h1 style = "color: #000"><center><%=total_prescription%></center></h1>
                            
                                <%
                                    Integer presc = 0;
                                    Statement Spresc = con.createStatement();
                                    ResultSet Rpresc;
                                    Rpresc = Spresc.executeQuery("select * from prescription where archive = 'no'");
                                    while (Rpresc.next())
                                    {
                                        presc++;
                                    }
                               %>
                               
                               <%
                                    Integer archived_presc = 0;
                                    Statement Sarchived_presc = con.createStatement();
                                    ResultSet Rarchived_presc;
                                    Rarchived_presc = Sarchived_presc.executeQuery("select * from prescription where archive = 'yes'");
                                    while (Rarchived_presc.next())
                                    {
                                        archived_presc++;
                                    }
                               %>
                            
                            </div> 
                        </div>
                    </div>
                     
                    <div class="col-sm-12 col-md-3">
                        <div class="card shadow mb-4 cardcustom">

                            <div class=" py-3 tablebg">
                                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-medkit" aria-hidden="true"></i> Medicines </h5>
                            </div>

                            <div class="card-body">
                               <%
                                    Integer total_medicine = 0;
                                    Statement Smed_total = con.createStatement();
                                    ResultSet Rmed_total;
                                    Rmed_total = Smed_total.executeQuery("select * from inventory where item_type = 'medicine'");
                                    while (Rmed_total.next())
                                    {
                                        total_medicine++;
                                    }
                               %>
                               <div class="chart-pie pt-4">
                                <canvas id="medicine"></canvas>
                                </div>
                                <hr class="sidebar-divider">
                                
                               <p><h5><center>Total Number of Medicine in Inventory: </center></h5></p><br><h1 style = "color: #000"><center><%=total_medicine%></center></h1>

                                    <hr class="sidebar-divider"><%
                                    Integer instock_med = 0;
                                    Statement Sinstock_med = con.createStatement();
                                    ResultSet Rinstock_med;
                                    Rinstock_med = Sinstock_med.executeQuery("select * from inventory where item_type = 'medicine' and archive = 'no'");
                                    while (Rinstock_med.next())
                                    {
                                        instock_med++;
                                    }
                                    %><!--<span><h3 style ="color: #1cc88a"><center>Instock : <%=instock_med%></center></h3></span>-->
                                    <%Integer archived_med = 0;
                                    Statement Sarchived_med = con.createStatement();
                                    ResultSet Rarchived_med;
                                    Rarchived_med = Sarchived_med.executeQuery("select * from inventory where item_type = 'medicine' and archive = 'yes'");
                                    while (Rarchived_med.next())
                                    {
                                        archived_med++;
                                    }
                                    %><!--<span><h3 style ="color: #be2617"><center>Archived : <%=archived_med%></center</h3></span>-->
                                    <%

                                %>    
                            </div> 
                        </div>
                    </div>
                      
                    <div class="col-sm-12 col-md-3">
                        <div class="card shadow mb-4 cardcustom">

                            <div class=" py-3 tablebg">
                                <h5 class="m-0 font-weight-bold"> &nbsp &nbsp <i class="fa fa-archive" aria-hidden="true"></i> Miscellaneous Items </h5>
                            </div>

                            <div class="card-body">
                               <%
                                    Integer total_misc = 0;
                                    Statement Smisc_total = con.createStatement();
                                    ResultSet Rmisc_total;
                                    Rmisc_total = Smisc_total.executeQuery("select * from inventory where item_type = 'miscellaneous'");
                                    while (Rmisc_total.next())
                                    {
                                        total_misc++;
                                    }
                               %>
                               <div class="chart-pie pt-4">
                                <canvas id="miscellaneous"></canvas>
                                </div>
                                <hr class="sidebar-divider">
                                
                               <p><h5><center>Miscellaneous Items in Inventory: </center></h5></p><br><h1 style = "color: #000"><center><%=total_misc%></center></h1>

                                    <hr class="sidebar-divider"><%
                                    Integer instock_misc = 0;
                                    Statement Sinstock_misc = con.createStatement();
                                    ResultSet Rinstock_misc;
                                    Rinstock_misc = Sinstock_misc.executeQuery("select * from inventory where item_type = 'miscellaneous' and archive = 'no'");
                                    while (Rinstock_misc.next())
                                    {
                                        instock_misc++;
                                    }
                                    %><!--<span><h3 style ="color: #1cc88a"><center>Instock : <%=instock_misc%></center></h3></span>-->
                                    <%Integer archived_misc = 0;
                                    Statement Sarchived_misc = con.createStatement();
                                    ResultSet Rarchived_misc;
                                    Rarchived_misc = Sarchived_misc.executeQuery("select * from inventory where item_type = 'miscellaneous' and archive = 'yes'");
                                    while (Rarchived_misc.next())
                                    {
                                        archived_misc++;
                                    }
                                    %><!--<span><h3 style ="color: #be2617"><center>Archived : <%=archived_misc%></center</h3></span>-->
                                    <%

                                %>    
                            </div> 
                        </div>
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

  <!-- Bootstrap core JavaScript-->
  <script src="jquery.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  
  <script src="Chart.min.js"></script>
  <!--<script src="chart-pie-demo.js"></script>-->
  
  <script>
      var ctx = document.getElementById("doctors");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Active Doctors", "Inactive Doctors"],
            datasets: [{
              data: [<%=active_doctor%>, <%=inactive_doctor%>],
              backgroundColor: ['#1cc88a', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>
  
  <script>
      var ctx = document.getElementById("personnel");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Active Personnel Accounts", "Inactive Personnel Accounts"],
            datasets: [{
              data: [<%=active_personnel%>, <%=inactive_personnel%>],
              backgroundColor: ['#1cc88a', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>
  
  <script>
      var ctx = document.getElementById("patients");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Active Patients", "Inactive Patients"],
            datasets: [{
              data: [<%=active_patient%>, <%=inactive_patient%>],
              backgroundColor: ['#1cc88a', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>
  
  <script>
      var ctx = document.getElementById("appointments");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Finished Appointments", "Pending Appointments", "Cancelled Appointments"],
            datasets: [{
              data: [<%=finished_appt%>, <%=pending_appt%>, <%=cancelled_appt%>],
              backgroundColor: ['#1cc88a','#e3b803', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#f9da5b', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>
  
  <script>
      var ctx = document.getElementById("prescriptions");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Prescriptions", "Archived Prescriptions"],
            datasets: [{
              data: [<%=presc%>, <%=archived_presc%>],
              backgroundColor: ['#1cc88a','#e3b803', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#f9da5b', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>
  
  <script>
      var ctx = document.getElementById("medicine");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Instock Medicine", "Phased Out Medicine"],
            datasets: [{
              data: [<%=instock_med%>, <%=archived_med%>],
              backgroundColor: ['#1cc88a','#e3b803', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#f9da5b', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>
  
  <script>
      var ctx = document.getElementById("miscellaneous");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Instock Items", "Archived Items"],
            datasets: [{
              data: [<%=instock_misc%>, <%=archived_misc%>],
              backgroundColor: ['#1cc88a','#e3b803', '#ae1515'],
              hoverBackgroundColor: ['#40dfa6', '#f9da5b', '#d45c5c'],
              
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 60,
          },
        });
  </script>

</body>
    
</html>
