<%

    String patient_id = request.getParameter("patient_id");
    //request.setAttribute("patient_id", patient_id);
    //request.getRequestDispatcher("admin_view_patient.jsp").forward(request, response);
    
    session.setAttribute("patient_id", patient_id);
    
    
    if (session.getAttribute("acct_Type").equals("admin"))
    {response.sendRedirect("admin_view_patient.jsp");}
    else if (session.getAttribute("acct_Type").equals("personnel"))
    {response.sendRedirect("personnel_view_patient.jsp");}
%>