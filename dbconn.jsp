<%@ page language="java"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    try {
        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcurl = "jdbc:mysql://localhost/yangjung1?serverTimezone=UTC";
        String user = "root";
        String password = "1234";
        Class.forName(jdbcDriver);

        conn = DriverManager.getConnection(jdbcurl, user, password);
        System.out.println("데이터베이스 연결 성공<br>");
    } catch (Exception ex) {
        System.out.println("데이터베이스 연결 실패");
        ex.printStackTrace();
    }
%>