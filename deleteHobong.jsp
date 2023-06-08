<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제</title>
    
</head>
<body>
    <%@ include file="dbconn.jsp" %>
    <%
        String position=request.getParameter("position");
        String hobong=request.getParameter("hobong");
        PreparedStatement pstmt=null;
        try {
            String sql="delete from hobong where position=? and hobong=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, position);
            pstmt.setString(2, hobong);
            %>
            <script>
                confirm('정말로 삭제하시겠습니까?')
            </script>
            <%
            pstmt.executeUpdate();
            %>
            <script>
                alert('삭제가 완료되었습니다!');
                location.href="selectHobong.jsp"
            </script>
            <%
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
</body>
</html>