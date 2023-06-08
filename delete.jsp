<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp 실습</title>

    <script>
        function check(){
            document.frm.submit()
        }
        
    </script>
</head>
<body>
    <%@ include file="header2.jsp"%>
    <%@ include file="nav2.jsp"%>
    <section>
    <hr>
        <h1>인사관리 사원정보 삭제 화면</h1>    
        <form name="frm" method="get" action="deleteProcess.jsp">
            <table border="1" id="tab3">
                <tr>
                    <td>사원번호</td>
                    <td><input type="text" name="id" id="in4"></td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" name="name" id="in4"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button"  id="btn" value="삭제" onclick="check()">
                        <input type="reset"  id="btn" value="취소">
                    </td>
                </tr>
            </table>
        </form>
    </hr>
    </section>
    <%@ include file="footer2.jsp"%>
</body>
</html>