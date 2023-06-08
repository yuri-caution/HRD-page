<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    PreparedStatement pstmt = null;
    String sql = "";
    ResultSet rs = null;
    String rst="";
    String msg="";

    int max = 0;
    try {
        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String standard = request.getParameter("standard");
        String memo = request.getParameter("memo");
        sql = "select max(num) from board";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(rs.next()){
            max = rs.getInt(1)+1;
        }
        else
            max=1;

        sql = "insert into board(num, name, password, title, memo, ref, time) value (?,?,?,?,?,?,sysdate())";

        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, max);
        pstmt.setString(2, name);
        pstmt.setString(3, password);
        pstmt.setString(4, title);
        pstmt.setString(5, memo);
        pstmt.setInt(6, max+1);
        pstmt.executeUpdate();
        System.out.println("저장 완료");
        %>
        <script>
            self.window.alert("입력한 글을 등록하였습니다.");
            location.href="boardList.jsp";
        </script>
        <%
    }catch(SQLException e){
        out.println(e.toString());
        e.printStackTrace();
    }
%>
