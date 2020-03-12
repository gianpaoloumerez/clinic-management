<%@ include file="connector.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%
    String patient_id = session.getAttribute("patient_id").toString();
    session.setAttribute("location","from_view_patient");
    
    Statement stPatient = con.createStatement();
    ResultSet rsPatient;
    rsPatient = stPatient.executeQuery("select name, birthday, gender, address, phone, tphone, date_updated from patient where count = '"+patient_id+"'");
    while (rsPatient.next())
    {
        session.setAttribute("appt_patient_id", patient_id);
        session.setAttribute("patient_name", rsPatient.getString("name"));
        session.setAttribute("patient_bd", rsPatient.getString("birthday"));
        Integer age = 0;
                                        Date currentdate = new Date();
                                        DateFormat Year = new SimpleDateFormat("yyyy");
                                        Integer cy = Integer.parseInt(Year.format(currentdate));
                                        DateFormat month = new SimpleDateFormat("MM");
                                        Integer cm = Integer.parseInt(month.format(currentdate));
                                        DateFormat date = new SimpleDateFormat("dd");
                                        Integer cd = Integer.parseInt(date.format(currentdate));
                                        
                                        Integer by = Integer.parseInt(rsPatient.getString("birthday").toString().substring(0,4));
                                        Integer bm = Integer.parseInt(rsPatient.getString("birthday").toString().substring(5,7));
                                        Integer bd = Integer.parseInt(rsPatient.getString("birthday").toString().substring(8,10));
                                        
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
        session.setAttribute("patient_age", age.toString());
        session.setAttribute("patient_sex", rsPatient.getString("gender"));
        session.setAttribute("patient_addr", rsPatient.getString("address"));
        session.setAttribute("patient_tp", rsPatient.getString("tphone"));
        session.setAttribute("patient_mobile", rsPatient.getString("phone"));
        session.setAttribute("patient_du", rsPatient.getString("date_updated"));
        session.setAttribute("from_patient_profile","true");
        
    }
    response.sendRedirect("personnel_select_doctor.jsp");
%>