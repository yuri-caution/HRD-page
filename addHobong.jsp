<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>호봉등록</title>
    <link rel="stylesheet" href="./css/style2.css">
    <script>
        function check(){
            document.frm.submit()
        }
    </script>
</head>
<body>
    <%@ include file="header2.jsp" %>
    <%@ include file="nav2.jsp" %>

    <section>
        <hr>
        <h1>인사관리 호봉 등록 화면</h1>
        <form name="frm" method="get" action="addHobongProcess.jsp">
            <table border="1", id="tab1">
                <tr>
                    <td>직급</td>
                    <td>
                        <select name="position">
                            <option value="1">1급</option>
                            <option value="2">2급</option>
                            <option value="3">3급</option>
                            <option value="4">4급</option>
                            <option value="5">5급</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>호봉</td>
                    <td>
                        <select name="hobong">
                            <option value="1">1호봉</option>
                            <option value="2">2호봉</option>
                            <option value="3">3호봉</option>
                            <option value="4">4호봉</option>
                            <option value="5">5호봉</option>
                            <option value="6">6호봉</option>
                            <option value="7">7호봉</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>급여</td>
                    <td><input type="text" name="salary"></td>
                </tr>
                <tr>
                    <td colspan="2", align="center">
                        <input type="button" id="btn" value="등록" onclick="check()">
                        <input type="reset" id="btn" value="취소">
                    </td>
                </tr>
            </table>

        </form>

    </section>
    <%@ include file="footer2.jsp"%>
</body>
</html>