<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ page import="java.sql.*" %>
<%
    session.invalidate();
    response.sendRedirect("index2.jsp");
%>