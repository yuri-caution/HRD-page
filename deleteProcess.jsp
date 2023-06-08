<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
        String id=request.getParameter("id");
        String name=request.getParameter("name");

        PreparedStatement pstmt=null; 
        ResultSet rs=null;
        try {
                String sql="select id,name from person where id=?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1,id);
                rs=pstmt.executeQuery();
                if(rs.next()){
                    String ID=rs.getString(1);
                    String NAME=rs.getString(2);
                    if(name.equals(NAME)){
                        sql="delete from person where id=?";
                        pstmt=conn.prepareStatement(sql);
                        pstmt.setString(1,id);
                        pstmt.executeUpdate();
                        %>
                        <script>
                            alert("삭제가 완료되었습니다!")
                            location.href="select.jsp"
                        </script>
                        <%
                    }else{
                        %>
                        <script>
                            alert("이름이 일치하지 않습니다.")
                        </script>
                        <%
                    }
                }else{
                    %>
                    <script>
                        alert("존재하지 않는 사번입니다.")
                        history.back(-1);
                    </script>
                    <%
                }
        }catch(Exception e){
            e.printStackTrace();
        } %>
</body>
</html>