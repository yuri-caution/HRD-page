<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    PreparedStatement pstmt=null;
    String sql="";
    ResultSet rs = null;
    String rst="";
    String msg ="";
    String password = null;
    String idx1 = request.getParameter("idx");

    int idx = Integer.parseInt(request.getParameter("idx"));
    String pw = request.getParameter("password");

    try {
        sql = "select password from board where num=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        rs = pstmt.executeQuery();
        
        if(rs.next()){
            password=rs.getString("password");
            if(pw.equals(password)){
                sql="delete from board where num=?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setInt(1, idx);
                pstmt.executeUpdate();

            %>
            <script>
                alert("해당 글을 삭제하였습니다.");
                location.href="boardList.jsp";
            </script>
            <%
            } else {
            %>
                <script>
                    alert("비밀번호가 틀렸습니다.");
                    history.back(-1);
                </script>
            <%
            }}else{
                %>
                <script>
                    alert("존재하지 않는 게시글 입니다.")
                    history.back(-1)
                </script>
                <%
            }
        } catch(SQLException e){
            out.println(e.toString());
        }
%>