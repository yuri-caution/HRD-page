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
        String idx=request.getParameter("idx");
        PreparedStatement pstmt=null;
        try {
            String sql="delete from board where num=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, idx);
            %>
            <script>
                confirm('정말로 삭제하시겠습니까?')
            </script>
            <%
            pstmt.executeUpdate();
            %>
            <script>
                alert('삭제가 완료되었습니다!');
                location.href="boardList.jsp"
            </script>
            <%
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
</body>
</html>