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

        String idx=request.getParameter("idx");
        String title=request.getParameter("title");
        String memo=request.getParameter("memo");

        try {
            String sql="update board set title=?, memo=? where num=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(3, idx);
            pstmt.setString(1, title);
            pstmt.setString(2, memo);
            pstmt.executeUpdate();
        
        %>
            <script>
                alert("수정 성공");
                location.href="boardList.jsp";
            </script>
            <%
        } catch(SQLException e){
            e.printStackTrace();
        }
    %>
</body>
</html>