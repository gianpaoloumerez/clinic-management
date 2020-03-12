

<div id = "sidebar">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

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
        Account Management
      </div>

      <!-- Nav Item - Patient Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapsTwo">
            <i class="fa fa-wheelchair" style="font-size:24px" aria-hidden="true"></i>
            <span> Patients</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Patient Management</h6>
            <a class="collapse-item" href="admin_dashboard.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Add Patient</a>
            <a class="collapse-item" href="admin_search_patient.jsp"><i class="fa fa-search" aria-hidden="true"></i> Search and Edit</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Doctor Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDoctor" aria-expanded="true" aria-controls="collapseDoctors">
          <i class="fa fa-user-md" style="font-size:24px" aria-hidden="true"></i>
            <span> Doctors</span>
        </a>
        <div id="collapseDoctor" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Doctor Management</h6>
            <a class="collapse-item" href="admin_add_doctor.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Add Doctor</a>
            <a class="collapse-item" href="admin_search_doctor.jsp"><i class="fa fa-search" aria-hidden="true"></i> Search and Edit</a>
          </div>
        </div>
      </li>
      
      
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePersonnel" aria-expanded="true" aria-controls="collapsePages">
          <i class="fa fa-medkit" style="font-size:24px" aria-hidden="true"></i>
          <span>Personnel</span>
        </a>
        <div id="collapsePersonnel" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Personnel Management</h6>
            <a class="collapse-item" href="admin_add_personnel.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Add Personnel</a>
            <a class="collapse-item" href="admin_search_personnel.jsp"><i class="fa fa-search" aria-hidden="true"></i> Search and Edit</a>
          </div>
        </div>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider">
       <div class="sidebar-heading">
        Inventory Management
      </div>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="admin_view_prescriptions.jsp" >
          <i class="fa fa-file-image-o" style="font-size:24px" aria-hidden="true"></i>
            <span> Prescriptions</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="admin_inventory_medicine.jsp" >
          <i class="fa fa-medkit" style="font-size:24px" aria-hidden="true"></i>
            <span> Medicines</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="admin_inventory_miscellaneous.jsp" >
          <i class="fa fa-archive" style="font-size:24px" aria-hidden="true"></i>
            <span> Miscellaneous</span>
        </a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
        Logs and Info
      </div>


      <!-- Nav Item - Logs -->
      <li class="nav-item">
        <a class="nav-link" href="admin_activity_log.jsp">
          <i class="fa fa-book" style="font-size:24px" aria-hidden="true"></i>
          <span> Activity Log</span></a>
      </li>

      <!-- Nav Item - Reports -->
      <li class="nav-item">
        <a class="nav-link" href="admin_site_info.jsp">
          <i class="fa fa-database" style="font-size:24px" aria-hidden="true"></i>
          <span> Info</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    
    </ul>
</div>