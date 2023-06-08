<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="./css/style2.css">

    <script>
        function check(){
            var form = document.writeform;
            form.submit();
        }

        function back(){
            history.back(-1);
        }
    </script>
</head>

<body>
    <%@ include file="header2.jsp" %>
    <%@ include file="nav2.jsp" %>
    <%
        checkName = (String)session.getAttribute("s_Name");
        if(checkName == null)
        {
            %>
            <script>
                self.window.alert("로그인 후 이용 가능합니다.");
                location.href = "index2.jsp";
            </script>
            <%
        }
    %>

    <section>
        <%@ include file="dbconn.jsp" %>
    <%
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String idx=request.getParameter("idx");
        String sql="select num, name, title, memo from board where num=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, idx);
        rs=pstmt.executeQuery();
        String name="";
        String title="";
        String memo="";
        if(rs.next()){
            name = rs.getString(2);
            title = rs.getString(3);
            memo = rs.getString(4);
        }
    %>
        <form name="writeform" method="get" action="updateBoardProcess.jsp">
            <table id="tab4">
                <tr>
                    <td>
                        <table width="70%" cellpadding="0" cellspacing="20" border="0" align="center">
                            <tr>
                                <td width="5"></td>
                                <td>수정하기</td>
                                <td width="5"></td>
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
                                <td align="left"><input name="name" size="10" maxlength="50" value="<%=name%>"></td>
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
                                    <input type="button" id="button" value="완료" onclick="check();">
                                    <input type="reset" id="button" value="초기화">
                                    <input type="button" id="button" value="취소" onclick="back();">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </section>
    <%@ include file="footer2.jsp" %>
</body>
</html>