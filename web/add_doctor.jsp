<form action="add_doctor_process" method="post">
            <div class="row">
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                </div>
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-8 add_patient">
                    <div class="row">
                          
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                            <br>
                            <p>Name : <input id="patient_name" name="name" class="form-control inpt" id="focusedInput" type="text" placeholder="Doctor's Full Name" required></p>
                            <p>Birth Date : <input id="patient_bdate" name="bdate" class="form-control inpt" id="focusedInput" type="date" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" required></p>
                            <!--<p>Age : <input id="patient_age" name="username" class="form-control inpt" id="focusedInput" type="number" placeholder="Patient's Age" disabled ></p>
                         --><p>Telephone : <input id="patient_telephone" name="tel" class="form-control inpt" id="focusedInput" pattern="[0-9]{8,}" placeholder="e.g. 12345678" required></p>
                            Mobile : <div class="row" style =" font-size: 20px"> &nbsp +63 &nbsp <input id="patient_mobile" name="mobile" class="form-control inpt" id="focusedInput" style =" width:75%" type="text" pattern="[0-9]{10,}" placeholder="e.g. 91234567890" required></div>
                            <p>Email : <input id="patient_name" name="email" class="form-control inpt" id="focusedInput" type="email" placeholder="e.g. yourname@email.com" required></p>
                            <p>Sex : <select class="form-control inpt" name="sex" required>
                                        <option> Female </option>
                                        <option> Male </option>
                                      </select></p>
                            <p>Address : <input id="patient_address" name="address" class="form-control inpt" id="focusedInput" type="text" placeholder="e.g. #123 Sample St. Manila City" required></p>
                            <br>
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-4">
                            <br>
                            <p>Marital Status : <select class="form-control inpt" name="status" required>
                                        <option> Single </option>
                                        <option> Married </option>
                                        <option> Divorced </option>
                                        <option> Separated </option>
                                        <option> Widowed </option>
                                      </select></p>
                            <p>Username: <input name="doctor_username" class="form-control inpt" id="focusedInput" type="text" placeholder="e.g. myname1234" required></p>
                            <p>Password : <input  name="doctor_password" class="form-control inpt" id="focusedInput" type="password" required></p>
                            <p>Department : <select  class="form-control inpt" name="department" required>
                                                <%@ include file="connector.jsp" %>
                                                <%@page import="java.sql.*"%>
                                                <%
                                                    
                                                    Statement stDepart = con.createStatement();
                                                    ResultSet rsDept;
                                                    rsDept = stDepart.executeQuery("select * from department");
                                                    while (rsDept.next())
                                                    {
                                                        %><option><%=rsDept.getString("department")%></option><%
                                                    }

                                                %>
                                            </select></p>
                            <br>
                            <p><input type="reset" name="submit_patient" class="btn btn-primary btn-user btn-block btnclr"  value="  Clear Inputs"></p>
                            <p><input type="button" name="submit_confirm" class="btn btn-primary btn-user btn-block btnadd"  data-toggle="modal" data-target="#confirm_modal" value="  Add Doctor "></p>
                            <h4><center><p><% try {if(session.getAttribute("successful").equals(null)){out.print(" ");} else {out.print(session.getAttribute("successful"));}} catch (Exception e) {out.print(" ");}%></p></center></h4>
                            
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
                        </div>
                        <div class="col-xs-11 col-sm-11 col-md-11 col-xl-1">
                        </div>
                    </div>
                </div>  
                <div class="col-xs-11 col-sm-11 col-md-11 col-xl-2">
                </div>
            </div>
              
        
          </form>