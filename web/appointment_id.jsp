<%

    String appt_id = request.getParameter("appt_id");
    String patient_id = request.getParameter("patient_id");
    String doctor_id = request.getParameter("doctor_id");
    String patient_name = request.getParameter("patient_name");
    
    if (session.getAttribute("acct_Type").equals("personnel"))
        {
            session.setAttribute("appointment_id", appt_id);
            session.setAttribute("patient_id", patient_id);
            session.setAttribute("doctor_id", doctor_id);
            session.setAttribute("patient_name", patient_name);
            session.setAttribute("from_appointment", "true");
            response.sendRedirect("personnel_view_appointment.jsp");
        }
    else
        {
            session.setAttribute("appointment_id", appt_id);
            session.setAttribute("patient_id", patient_id);
            session.setAttribute("from_appointment", "true");
            response.sendRedirect("doctor_view_appointment.jsp");
        }
%>