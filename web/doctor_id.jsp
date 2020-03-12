<%

    String patient_id = request.getParameter("doctor_id");
    //request.setAttribute("patient_id", patient_id);
    //request.getRequestDispatcher("admin_view_patient.jsp").forward(request, response);
    
    session.setAttribute("doctor_id", patient_id);
    response.sendRedirect("admin_view_doctor.jsp");
%>