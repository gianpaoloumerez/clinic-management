<%
    if (session.getAttribute("transaction").equals("appointment"))
    {
        session.setAttribute("patient_id","");
        session.setAttribute("patient_name","");
        session.setAttribute("patient_bd","");
        session.setAttribute("patient_age","");
        session.setAttribute("patient_sex","");
        session.setAttribute("patient_height","");
        session.setAttribute("patient_weight","");
        session.setAttribute("patient_bp1","");
        session.setAttribute("patient_bp2","");
        session.setAttribute("patient_addr","");
        session.setAttribute("patient_tp","");
        session.setAttribute("patient_mobile","");
        session.setAttribute("patient_du","");

        session.setAttribute("doctor_id","");
        session.setAttribute("doctor_name","");
        session.setAttribute("doctor_age","");
        session.setAttribute("doctor_sex","");
        session.setAttribute("doctor_dept","");
        session.setAttribute("doctor_tp","");
        session.setAttribute("doctor_mobile","");

        response.sendRedirect("personnel_dashboard.jsp");
    }
    else if (session.getAttribute("transaction").equals("reservation"))
    {
        session.setAttribute("r_patient_id","");
        session.setAttribute("r_patient_name","");
        session.setAttribute("r_patient_bd","");
        session.setAttribute("r_patient_age","");
        session.setAttribute("r_patient_sex","");
        session.setAttribute("r_patient_height","");
        session.setAttribute("r_patient_weight","");
        session.setAttribute("r_patient_bp1","");
        session.setAttribute("r_patient_bp2","");
        session.setAttribute("r_patient_addr","");
        session.setAttribute("r_patient_tp","");
        session.setAttribute("r_patient_mobile","");
        session.setAttribute("r_patient_du","");

        session.setAttribute("r_doctor_id","");
        session.setAttribute("r_doctor_name","");
        session.setAttribute("r_doctor_age","");
        session.setAttribute("r_doctor_sex","");
        session.setAttribute("r_doctor_dept","");
        session.setAttribute("r_doctor_tp","");
        session.setAttribute("r_doctor_mobile","");

        response.sendRedirect("personnel_reservation.jsp");
    }
%>