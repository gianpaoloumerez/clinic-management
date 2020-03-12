<nav class="navbar navbar-expand navbar-light bg-topbar topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3" style="color: white">
            <i class="fa fa-bars"></i>
          </button>
          
          <script>
              (function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var e0 = e.originalEvent,
        delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  //$(document).on('click', 'a.scroll-to-top', function(e) {
   // var $anchor = $(this);
    //$('html, body').stop().animate({
      //scrollTop: ($($anchor.attr('href')).offset().top)
    //}, 1000, 'easeInOutExpo');
    //e.preventDefault();
  //});

})(jQuery);
          </script>
          
        <%@page import="java.text.SimpleDateFormat"%>
        <%@page import="java.text.DateFormat"%>
        <%@page import="java.util.Date"%>
        
        <%
            Date currentdate_TB = new Date();
            DateFormat DFormat_TB = new SimpleDateFormat("MMMM dd yyyy");
            DateFormat Day_TB = new SimpleDateFormat("EEEE, ");
            String cdate_TB =DFormat_TB.format(currentdate_TB);
            String cday_TB =Day_TB.format(currentdate_TB);
        %>
        
          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <!--<li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <!--<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>-->
              
              <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">&nbsp;<i><b><%=cday_TB%></b><%=cdate_TB%></i></span>
              </a>
              </li>
            
              <div class="topbar-divider d-none d-sm-block"></div>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small"><i class="fa fa-users"></i> &nbsp; Personnel</span>
                    </a>
                </li>
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%out.print(session.getAttribute("personnelName"));%></span>
                <img class="img-profile rounded-circle" src="personnel.png">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                 
                  <!--<span style = "color: #000">
                      <center><i class="fa fa-users" aria-hidden="true"></i>
                          Personnel</center>
                </span>
               <div class="dropdown-divider"></div>-->
                  
                <a class="dropdown-item" href="" data-toggle="modal" data-target="#personnel_setting">
                  <i class="fa fa-cogs" aria-hidden="true"></i>
                   Settings
                </a>
               <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
                  <i class="fa fa-sign-out" aria-hidden="true"></i>
                   Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        
        <div class="modal fade" id="personnel_setting" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-cogs" aria-hidden="true"></i> Account Settings</h5>
                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                  
                  <div class="modal-body">
                        <br>
                        <a class="btn btn-secondary btn-user btn-block btnedit" href="personnel_update_profile.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i> &nbsp;Update Profile</a>
                        <br>
                        <a class="btn btn-secondary btn-user btn-block btnedit" href="personnel_change_username.jsp"><i class="fa fa-cog" aria-hidden="true"></i> &nbsp;Change Username</a>
                        <br>
                        <a class="btn btn-secondary btn-user btn-block btnedit" href="personnel_change_password.jsp"><i class="fa fa-cog" aria-hidden="true"></i> &nbsp;Change Password</a>
                        <br>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </div>
              </div>
            </div>
          </div>

    