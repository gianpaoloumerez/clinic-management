<%@ include file="connector.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%
    if (session.getAttribute("transaction").equals("appointment"))
    {
        String doctor_id = request.getParameter("doctor_id");
        session.setAttribute("appt_doctor_id", doctor_id);


        Statement stPatient = con.createStatement();
        ResultSet rsPatient;
        rsPatient = stPatient.executeQuery("select * from doctor where count = '"+doctor_id+"'");
        while (rsPatient.next())
        {
            session.setAttribute("doctor_name", rsPatient.getString("name"));
            session.setAttribute("doctor_sex", rsPatient.getString("gender"));
            session.setAttribute("doctor_tp", rsPatient.getString("tphone"));
            session.setAttribute("doctor_mobile", rsPatient.getString("phone"));
            session.setAttribute("doctor_dept", rsPatient.getString("dept"));
            
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
            session.setAttribute("doctor_age", age);
            
            
        }
        response.sendRedirect("personnel_select_doctor.jsp");
    }
    else if (session.getAttribute("transaction").equals("reservation"))
    {
        String doctor_id = request.getParameter("doctor_id");
        session.setAttribute("r_doctor_id", doctor_id);


        Statement stPatient = con.createStatement();
        ResultSet rsPatient;
        rsPatient = stPatient.executeQuery("select * from doctor where count = '"+doctor_id+"'");
        while (rsPatient.next())
        {
            session.setAttribute("r_doctor_name", rsPatient.getString("name"));
            session.setAttribute("r_doctor_age", rsPatient.getString("age"));
            session.setAttribute("r_doctor_sex", rsPatient.getString("gender"));
            session.setAttribute("r_doctor_tp", rsPatient.getString("tphone"));
            session.setAttribute("r_doctor_mobile", rsPatient.getString("phone"));
            session.setAttribute("r_doctor_dept", rsPatient.getString("dept"));
        }
        response.sendRedirect("personnel_select_doctor_resv.jsp");
    }
%>