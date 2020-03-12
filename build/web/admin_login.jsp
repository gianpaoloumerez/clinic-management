<%-- 
    Document   : index
    Created on : Jan 16, 2020, 12:54:39 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session_checker_index.jsp" %>
<%//request.setAttribute("login_error", "  ");%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
		
        <title>CMS</title>
        
        <style>
		body
			{
				background-image: url("index_bg.png");
                                background-size: 100%;
                                background-position: center;
			}
		.container .logincontent
			{
				font-family: sans-serif;
				background-color: #4169E1;
				color:#ffffff;
				border: solid 2px #4169E1;
				border-radius: 40px 40px 40px 40px ;
			}
		.container .login
			{ 
				font-family:sans-serif;
				background-color: white;
				color:#000000;
				border:solid 2px #4169E1;
				border-radius: 40px 40px 40px 40px;
			}
		.btn-color
			{
                                height: 50px;
				background-color:#4169E1;
                                border-radius: 40px 40px 40px 40px;
				color: #ffffff;
			}
                .inpt
                        {
                                height: 50px;
                                border-radius: 40px 40px 40px 40px;
                        }
</style>

        
    </head>
    
    
    <body onbeforeunload = "messageReset();">
        <div style="max-width:550px; margin:0 auto; border:none;">
        <div class="container">
        <div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12" style="margin:30px;">

	
	<form action="admin_login_process" method="post">
                    <br>
                    <div class="row">
                    
			<div class="col-xs-11 col-sm-11 col-md-10  ">
                            <center><img src="Logo.png" alt="" width="170px" height="170px" /></center><br>
			</div>
                    </div>
                    
		<div class="row">
                    
			<div class="col-xs-11 col-sm-11 col-md-10 logincontent ">
                            <p><h3><center>Administrator Log In<center></h3></p>
			</div> 
		</div>
                    <div class="row">
                    
			<div class="col-xs-11 col-sm-11 col-md-10 ">
                            <p>   </p>
			</div> 
		</div>
	
		<div class="row">
			<div class="col-xs-11 col-sm-11 col-md-10 login">
                            <br>    
                            <br>
                                <p><input id="username" name="username" class="form-control inpt" id="focusedInput" type="text" placeholder="Username"></p>
				<p><input id="password" name="password" class="form-control inpt" id="focusedInput" type="password" placeholder="Password"></p>
                                <center> <% try {if(session.getAttribute("login_error").equals(null)){out.print(" ");} else {out.print(session.getAttribute("login_error"));}} catch (Exception e) {out.print(" ");}%>  
                                </center>
                                <p><br><input type="submit" name="login" class="btn btn-color btn-block"  value=" Login "></p>
                                <p><center><a href="index.jsp">Go Back</a></center></p>
			</div>
		</div>
	</form>
  </div>
 
  </div>
  </div>
  </div>
                                
    <!--<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="warning">Warning!</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Incorrect Username or Password</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Go Back</button>
        </div>
      </div>
    </div>
  </div>-->
                                
     <%@ include file="footer.jsp" %>    
     <script>
    function messageReset() {
      <%session.setAttribute("login_error","");%>
    }
    </script>
    </body>
</html>
