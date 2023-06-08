<%@ page language="java" pageEncoding="utf-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>게시글 수정</title>
        <script>
            function modifyCheck(){
                var form = document.modifyform;
            if(!form.password.value){
                alert("비밀번호를 입력하세요.");
                form.password.focus();
                return;
            }
            if(!form.title.value){
                alert("제목을 입력하세요.");
                form.title.focus();
                return;
            }
            if(!form.memo.value){
                alert("내용을 입력하세요.");
                form.memo.focus();
                return;
            }
            form.submit();
            }
        </script>
    </head>
    <body>
        <%@ include file="header2.jsp" %>
        <%@ include file="nav2.jsp" %>

        <%@ include file="dbconn.jsp" %>
        <%
            checkName = (String)session.getAttribute("s_Name");
            if(checkName==null){
        %>
            <script>
                alert("먼저 로그인 하세요.");
                history.back();
            </script>
        <%}%>

        <section>
            <%
                request.setCharacterEncoding("utf-8");
                PreparedStatement pstmt = null;
                String sql="";
                ResultSet rs=null;
                String rst = "";
                String msg = "";
                String name =null;
                String password=null;
                String title = null;
                String memo = null;

                int idx = Integer.parseInt(request.getParameter("idx"));

                try {
                    sql="select name, password, title, memo from board where num=?";
                    pstmt=conn.prepareStatement(sql);
                    pstmt.setInt(1, idx);

                    rs = pstmt.executeQuery();
                    if(rs.next()){
                        name=rs.getString(1);
                        password=rs.getString(2);
                        title = rs.getString(3);
                        memo=rs.getString(4);
                    }
                }catch(SQLException e){
                    out.println(e.toString());
                }
            %>
            
            <form name="modifyform" method="post" action="boardUpdateProcess.jsp?idx=<%=idx%>">
                <table width="480" cellpadding=0 cellspacing=20 border=0 align="center">
                    <tr>
                        <td id="title" colspan="3" align="center" height=30>수정</td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">제목</td>
                        <td><input name="title" size="50" maxlength="100" value="<%=title%>"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">이름</td>
                        <td align="left"><input name="name" size="10" maxlength="50" value="<%=checkName%>"></td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd">
                        <td colspan="4"></td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">비밀번호</td>
                        <td align="left"><input type="password" name="password" size="10" maxlength="100"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">내용</td>
                        <td><textarea name="memo" cols="50" rows="13"><%=memo%></textarea></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr height="1" bgcolor="#82b5df">
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input type="button" id="button" value="수정" onclick="modifyCheck();">
                            <input type="reset" id="button" value="취소">
                        </td>
                    </tr>
                </table>
            </form>
        </section>
            <%@ include file="footer2.jsp" %>
    </body>
</html>