<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사원등록</title>

    <script>
        function check(){
            if(document.frm.id.value==""){
                alert("사번이 입력되지 않았습니다.");
                document.frm.id.focus();
                return false;
            }
            if(isNaN(document.frm.id.value)){
                alert("사번은 숫자만 가능합니다.");
                document.frm.id.focus();
                return false;
            }
            if(document.frm.id.value.length < 4 || document.frm.id.value.length > 8){
                alert("사번은 4~8자리만 가능합니다.");
                document.frm.id.focus();
                return false;
            }
            if(document.frm.name.value==""){
                alert("성명이 입력되지 않았습니다.");
                document.frm.name.focus();
                return false;
            }
            document.frm.submit()
        }
        
    </script>
</head>
<body>
    <%@ include file="header2.jsp"%>
    <%@ include file="nav2.jsp"%>
    <section>
    <hr>
        <h1>인사관리 사원등록 화면</h1>    
        <form name="frm" method="get" action="addProcess.jsp">
            <table border="1" id="tab1">
                <tr>
                    <td>사원번호</td>
                    <td><input type="text" name="id" id="in1">숫자만 가능</td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" name="name" id="in1"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="name" id="in1"></td>
                </tr>
                <tr>
                    <td>소속부서</td>
                    <td>
                        <select name="dept">
                            <option value="인사부">인사부</option>
                            <option value="기획부">기획부</option>
                            <option value="홍보부">홍보부</option>
                            <option value="영업부">영업부</option>
                            <option value="경리부">경리부</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>직급</td>
                    <td>
                        <input type="radio" name="position" value="1" checked>1급
                        <input type="radio" name="position" value="2">2급
                        <input type="radio" name="position" value="3">3급
                        <input type="radio" name="position" value="4">4급
                        <input type="radio" name="position" value="5">5급
                    </td>
                </tr>
                <tr>
                    <td>호 봉</td>
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
                    <td>직책</td>
                    <td><input type="text" name="duty" id="in1"></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td>
                        <input type="text" name="phone1" id="in3">-
                        <input type="text" name="phone2" id="in3">-
                        <input type="text" name="phone3" id="in3">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="emailID" id="in3" placeholder="이메일">@
                        <select name="emailAD">
                            <option value="daum.net">daum.net</option>
                            <option value="naver.com">naver.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="korea.com">korea.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="address" id="in1"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button"  id="btn" value="등록" onclick="check()">
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