<%@ include file="connector.jsp" %>
<%@page import="java.sql.*"%>

<%

    session.setAttribute("deptName",request.getParameter("dept_name"));
    response.sendRedirect("admin_edit_departments.jsp");

%>