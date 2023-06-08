<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%@ include file="dbconn.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");
        PreparedStatement pstmt = null;

        String position=request.getParameter("position");
        String hobong=request.getParameter("hobong");
        String salary=request.getParameter("salary");

        try {
            String sql="insert into hobong values(?,?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, position);
            pstmt.setString(2, hobong);
            pstmt.setString(3, salary);
            pstmt.executeUpdate();
        

    %>

        <script>
            alert("호봉 등록 성공");
            history.back(-1);
        </script>

        <%

        } catch(SQLException e){
            e.printStackTrace();
        }
        %>
</body>
</html>