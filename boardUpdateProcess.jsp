<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    PreparedStatement pstmt=null;
    String sql="";
    ResultSet rs=null;
    String rst="";
    String msg="";
    String password="";

    int idx = Integer.parseInt(request.getParameter("idx"));

    String title = request.getParameter("title");
    String memo = request.getParameter("memo");
    String pw = request.getParameter("password");

    try {
        sql="select password from board where num=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        rs=pstmt.executeQuery();

        if(rs.next()){
            password=rs.getString(1);
        }
        if(password.equals(pw)){
            sql="update board set title=?, memo=? where num=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, memo);
            pstmt.setInt(3, idx);
            pstmt.executeUpdate();
            %>
            <script>
                self.window.alert("수정이 완료되었습니다.");
                location.href="view.jsp?idx=<%=idx%>";
            </script>
            <%
        }else{
            %>
            <script>
                self.window.alert("비밀번호가 틀렸습니다.");
                history.back();
            </script>
            <%
        }
    }catch(SQLException e){
        out.println(e.toString());
    }
%>