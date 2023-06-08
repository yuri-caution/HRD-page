<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>삭제 페이지</title>
        <script>
            function deleteCheck(){
                console.log("삭제 중")
                var form = document.deleteform;

                if(!form.password.value){
                    alert("비밀번호를 적어주세요.");
                    form.password.focus();
                    return;
                }
                form.submit();
            }
        </script>
    </head>
    <body>
        <%@ include file="header2.jsp" %>
        <%@ include file="nav2.jsp" %>
        <%
        int idx = Integer.parseInt(request.getParameter("idx"));
        checkName = (String)session.getAttribute("s_Name");
        if(checkName==null){
            %>
            <script>
                alert("로그인 후 이용하세요.");
                history.back();
            </script>
            <%
        }
        %>

        <section>
            <form name="deleteform" method="post" action="boardDeletProcess.jsp?idx=<%=idx%>">
                <table width=480 cellpadding="0" cellspacing="20" border="0" align="center">
                    <tr>
                        <td id="title" colspan="3" align="center" height=30>삭제</td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">비밀번호</td>
                        <td><input name="password" type="password" size="50" maxlength="100"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height=1, bgcolor="dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr height=1, bgcolor="dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr align="center">
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type="button" value="삭제" onclick="deleteCheck();">
                            <input type="reset" value="취소">
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </form>
        </section>
        <%@ include file="footer2.jsp" %>
    </body>
</html>