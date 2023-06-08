<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%@ include file="header2.jsp" %>
    <%@ include file="nav2.jsp" %>
    <section>
        <%@ include file="dbconn.jsp" %>
    <%
        checkName = (String)session.getAttribute("s_Name");
        if(checkName==null){
        %>
        <script>
            alert("먼저 로그인을 하세요.");
            history.back();
        </script>
        <% }else {
        PreparedStatement pstmt=null;
        String sql="";
        ResultSet rs=null;
        String rst="";
        String msg="";

        int idx=Integer.parseInt(request.getParameter("idx"));

        int max = 0;
        try {
            sql="select num, name, title, memo, time, hit from board where num=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        rs=pstmt.executeQuery();
        if(rs.next()){
            String name = rs.getString(2);
            String title = rs.getString(3);
            String memo = rs.getString(4);
            String time = rs.getString(5);
            int hit = rs.getInt(6);
            hit++;
    %>
        <table>
            <tr>
                <td>
                    <table width=450 cellpadding="0" cellspacing="20" border="0" align="center">
                        <tr>
                            <td id="title" colspan="3" align="center" height=30>내용</td>
                        </tr>
                    </table>
                    <table width="70%" cellpadding=0 cellspacing=0 border=0 align="center" id="view_box">
                        <tr>
                            <td width=0>&nbsp;</td>
                            <td width=76>글번호</td>
                            <td width=58 align="left"><%=idx%></td>
                            <td width=0>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td width=0>&nbsp;</td>
                            <td>조회수</td>
                            <td width=58 align="left"><%=hit%></td>
                            <td width=0>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td width=73>작성자</td>
                            <td align="left"><%=name%></td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td width=164>작성일</td>
                            <td align="left"><%=time%></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">제목</td>
                            <td width=379 align="left"><%=title%></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan=2 height=300 width=300 align="left"><%=memo%></td>
                            <td>&nbsp;</td>
                        </tr>
                        <%
                        sql="update board set hit=? where num=?";
                        pstmt=conn.prepareStatement(sql);
                        pstmt.setInt(1, hit);
                        pstmt.setInt(2, idx);
                        pstmt.executeUpdate();
                        }
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                        %>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr height="3"></tr>
                        <tr height="1" bgcolor=""#82b5df>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <input type="reset" id="button" value="글쓰기" onclick="window.location='insertBoard.jsp'">
                                <input type="reset" id="button" value="답글" onclick="window.location='boardReply.jsp?idx=<%=idx%>'">
                                <input type="reset" id="button" value="목록" onclick="window.location='boardList.jsp'">
                                <input type="button" id="button" value="수정" onclick="window.location='boardUpdate.jsp?idx=<%=idx%>'">
                                <input type="button" id="button" value="삭제"  onclick="window.location='boardDelet.jsp?idx=<%=idx%>'">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <%
        }
    %>
    </section>
    <%@ include file="footer2.jsp" %>
</body>
</body>
</html>