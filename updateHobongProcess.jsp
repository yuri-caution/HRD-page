<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
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
            String sql="update hobong set salary=? where position=? and hobong=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(2, position);
            pstmt.setString(3, hobong);
            pstmt.setString(1, salary);
            pstmt.executeUpdate();
        
        %>
            <script>
                alert("사원정보 수정 성공");
                location.href="selectHobong.jsp";
            </script>
            <%
        } catch(SQLException e){
            e.printStackTrace();
        }
    %>
</body>
</html>