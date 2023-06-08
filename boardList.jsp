<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
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
                    alert("로그인 후 이용가능합니다.");
                    history.back();
                </script>
                <%
            } else { %>
                

        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String rst ="";
            String msg ="";
            int total = 0;

            try {
                String sql="select count(*) from board";
                pstmt=conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    total = rs.getInt(1);
                }
                rs.close();

                sql = "select num, name, title, time, hit, indent from board order by ref desc, step asc";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
            

        %>

        <table id="tab5">
            <tr>
                <td colspan=7 id="total"><%out.print("총 게시물 : "+total+"개");%></td>
            </tr>
            <tr height=5><td width=5></td></tr>
            <tr height=1 bgcolor="#82b5df">
                <td colspan=6 width=752></td>
            </tr>
            <tr id="top">
                <td align="center" width=5></td>
                <td align="center" width=73>번호</td>
                <td align="center" width=379>제목</td>
                <td align="center" width=73>작성자</td>
                <td align="center" width=164>작성일</td>
                <td align="center" width=58>조회수</td>
                <td align="center" width=7></td>
            </tr>
            <tr height=1 bgcolor="#82b5df">
                <td colspan=6 width=752></td>
            </tr>
            <%
            if(total==0){
                %>
            <tr align="center" bgcolor="#ffffff" height=30>
                <td colspan=6>등록된 글이 없습니다.</td>
            </tr>
            <%
            }else{
                while(rs.next()){
                    int idx = rs.getInt(1);
                    String name = rs.getString(2);
                    String title = rs.getString(3);
                    String time = rs.getString(4);
                    int hit = rs.getInt(5);
                    int indent = rs.getInt(6);

                %>
            <tr height=25 align="center">
                <td>&nbsp;</td>
                <td><%=idx %></td>
                <td align="left">
                <%
                for(int j=0; j<indent; j++){
                    %> &nbsp;&nbsp;&nbsp;
                    <%
                }
                if(indent !=0){
                    %>
                    <img src="./reply_icon.png">
                    <%
                }
                %>
                <a href="view.jsp?idx=<%=idx%>"><%=title%></a></td>
                <td align="center"><%=name%></td>
                <td align="center"><%=time%></td>
                <td align="center"><%=hit%></td>
                <td>&nbsp;</td>
            </tr>
            <tr height=1 bgcolor="#d2d2d2">
                <td colspan=6></td>
            </tr>
                <%
                }
            }
        }catch(SQLException e){
            out.println(e.toString());
        }
            %>

            <tr height=1 bgcolor="#82b5df">
                <td colspan=6 width=752></td>
            </tr>
        </table>
        <table width="100%" cellpadding=0 cellspacing=0 border=0>
            <tr>
                <td colspan=4 height=5></td>
            </tr>
            <tr align="center">
                <td><input type="button" id="btn2" value="글쓰기" onclick="window.location='insertBoard.jsp'"></td>
            </tr>
        </table>

        <%}%>
    </section>
        <%@ include file="footer2.jsp" %>
</body>
</html>