<div id = "sidebar">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <!--<a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
          <div class="sidebar-brand-text mx-3"><br><br><img src="Logo.png" alt="" width="90px" height="90px" /></div>
      </a>-->

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="">
            <center><br><img src="Logo.png" alt="" width="80px" height="80px"/>
          <h3>CMS</h3></center></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Personnel Account
      </div>

      <!-- Nav Item - Appointment Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapsTwo">
            <i class="fa fa-calendar" style="font-size:24px" aria-hidden="true"></i>
            <span> Appointments</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Appointment</h6>
            <a class="collapse-item" href="personnel_dashboard.jsp"><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> New Appointment</a>
            <!--<a class="collapse-item" href="personnel_reservation.jsp"><i class="fa fa-calendar-minus-o" aria-hidden="true"></i> Set Reservation</a>
            -->
            <a class="collapse-item" href="personnel_manage_appointment_today.jsp"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Today</a>
            <a class="collapse-item" href="personnel_manage_appointment.jsp"><i class="fa fa-search" aria-hidden="true"></i> All Appointment</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Patient Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDoctor" aria-expanded="true" aria-controls="collapseDoctors">
          <i class="fa fa-wheelchair" style="font-size:24px" aria-hidden="true"></i>
            <span> Patients</span>
        </a>
        <div id="collapseDoctor" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Patient Management</h6>
            <a class="collapse-item" href="personnel_add_patient.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Add Patient</a>
            <a class="collapse-item" href="personnel_search_patient.jsp"><i class="fa fa-search" aria-hidden="true"></i> Search and Edit</a>
          </div>
        </div>
      </li>
      
      
       <li class="nav-item">
        <a class="nav-link collapsed" href="personnel_view_prescriptions.jsp" >
          <i class="fa fa-file-image-o" style="font-size:24px" aria-hidden="true"></i>
            <span> Prescriptions</span>
        </a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInvent" aria-expanded="true" aria-controls="collapseInvent">
          <i class="fa fa-list-alt" style="font-size:24px" aria-hidden="true"></i>
            <span> Inventory</span>
        </a>
        <div id="collapseInvent" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Inventory Management</h6>
            <a class="collapse-item" href="personnel_inventory_medicine.jsp"><i class="fa fa-medkit" aria-hidden="true"></i> Medicines</a>
            <a class="collapse-item" href="personnel_inventory_miscellaneous.jsp"><i class="fa fa-archive" aria-hidden="true"></i> Miscellaneous</a>
          </div>
        </div>
      </li>
      

      <!-- Divider -->
      <!--<hr class="sidebar-divider">-->

      <!-- Heading -->
      <!--<div class="sidebar-heading">
        Activity
      </div>-->


      <!-- Nav Item - profile -->
      <!--<li class="nav-item">
        <a class="nav-link" href="personnel_update_profile.jsp">
          <i class="fa fa-user-circle" style="font-size:24px" aria-hidden="true"></i>
          <span> Update Profile</span></a>
      </li>-->
      <!-- Nav Item - Logs -->
      <!--<li class="nav-item">
        <a class="nav-link" href="">
          <i class="fa fa-book" style="font-size:24px" aria-hidden="true"></i>
          <span> Activity Log</span></a>
      </li>-->

      

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>
    </div>