<%
    try
    {
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        
        if (!session.getAttribute("uname").equals(null))
        {
            if (session.getAttribute("acct_Type").equals("admin"))
            {response.sendRedirect("admin_dashboard.jsp");}
            
            else if (session.getAttribute("acct_Type").equals("doctor"))
            {response.sendRedirect("doctor_dashboard.jsp");}
            
            else if (session.getAttribute("acct_Type").equals("personnel"))
            {response.sendRedirect("personnel_dashboard.jsp");}
        }
        
    }
    
    catch (Exception e)
    {
            //response.sendRedirect("index.jsp");
    }
%>