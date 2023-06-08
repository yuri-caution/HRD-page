<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>

    <script>
        function replyWriteCheck(){
            var form = document.writeform;
            if(form.name.value==""){
                alert("이름을 입력하세요.");
                return false;
            }
            if(form.password.value==""){
                alert("비밀번호를 입력하세요.");
                form.password.focus();
                return false;
            }
            if(form.memo.value==""){
                alert("내용을 입력하세요.");
                form.memo.focus();
                return false;
            }
            form.submit();
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
        <form name="writeform" method="post" action="#">
            <table id="tab4">

                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="20" border="0" align="center">
                            <tr>
                                <td id="title" colspan="3" align="center" height=30>답글쓰기</td>
                            </tr>
                        </table>
                        <table border="0">
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
                                <td align="center">내용</td>
                                <td><textarea name="reply" cols="50" rows="8"></textarea></td>
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
                                    <input type="button" id="button" value="등록" onclick="replyWriteCheck();">
                                    <input type="reset" id="button" value="취소">
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