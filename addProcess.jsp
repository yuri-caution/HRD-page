<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp example</title>
</head>
<body>
    <%@ include file="dbconn.jsp"%>;
    <%
        request.setCharacterEncoding("utf-8");

        PreparedStatement pstmt = null;

        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String dept=request.getParameter("dept");
        String position=request.getParameter("position");
        String hobong=request.getParameter("hobong");
        String duty=request.getParameter("duty");
        String phone1=request.getParameter("phone1");
        String phone2=request.getParameter("phone2");
        String phone3=request.getParameter("phone3");
        String phone=phone1 + "-" + phone2 + "-" + phone3;
        String emailID=request.getParameter("emailID");
        String emailAD=request.getParameter("emailAD");
        String email=emailID + "@" + emailAD;
        String address=request.getParameter("address");

        try {
            String sql="insert into person values(?,?,?,?,?,?,?,?,?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,name);
            pstmt.setString(3,password);
            pstmt.setString(4,dept);
            pstmt.setString(5,position);
            pstmt.setString(6,hobong);
            pstmt.setString(7,duty);
            pstmt.setString(8,phone);
            pstmt.setString(9,email);
            pstmt.setString(10,address);
            pstmt.executeUpdate();
    %>

        <script>
            alert("사원정보 등록 성공");
            history.back(-1);
        </script>
        
        <%
        }catch(SQLException e){
            e.printStackTrace();
        }
        %>
</body>
</html>