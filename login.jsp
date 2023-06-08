<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ page import="java.sql.*" %>
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
        String id=request.getParameter("id");
        String pswd=request.getParameter("passwd");
        String name ="";

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            String sql="select * from person where id=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()){
                String ID=rs.getString("id");
                String PSWD=rs.getString("password");
                String NAME=rs.getString("name");

                if(pswd.equals(PSWD)){ %>
                    <%=NAME%>님 환영합니다.
                    <%
                    session.setAttribute("s_Name", NAME);
                    session.setAttribute("s_Id", ID);

                    response.sendRedirect("index2.jsp");
                }
                else {
                    %>
                    <script>
                        alert("비밀번호 오류\n비밀번호를 다시 입력하세요.");
                        history.back();
                    </script>
                    <%
                    }
                } else{ %>
                    <script>
                        alert("ID오류\nID를 다시 입력하세요.");
                        history.back();
                    </script>
                <%}
               } catch(SQLException e) {
                    out.println(e.getMessage());
                }   
            
    %>    
</body>
</html>