<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
        <%@ include file="dbconn.jsp" %>
    <%
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        String id=request.getParameter("id");
        String sql="select id, name, password, dept, position, hobong, duty, phone, email, address from person where id=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs=pstmt.executeQuery();
        if(rs.next()){
            String name=rs.getString("name");
            String password=rs.getString("password");
            String dept=rs.getString("dept");
            String position=rs.getString("position");
            String hobong=rs.getString("hobong");
            String duty=rs.getString("duty");
            String phone=rs.getString("phone");
            String ph[]=phone.split("-");
            String email=rs.getString("email");
            String em[]=email.split("@");
            String address=rs.getString("address");
    %>
    <hr>
        <h1>인사관리 사원정보 변경 화면</h1>    
        <form name="frm" method="get" action="UpdateProcess.jsp">
            <table border="1" id="tab1">
                <tr>
                    <td>사원번호</td>
                    <td><input type="text" name="id" id="in1" value="<%=id%>"></td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" name="name" id="in1" value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="text" name="password" id="in1" value="<%=password%>"></td>
                </tr>
                <tr>
                    <td>소속부서</td>
                    <td>
                        <select name="dept">
                            <option value="인사부" <%=dept.equals("인사부")?"selected":"" %>>인사부</option>
                            <option value="기획부" <%=dept.equals("기획부")?"selected":"" %>>기획부</option>
                            <option value="홍보부" <%=dept.equals("홍보부")?"selected":"" %>>홍보부</option>
                            <option value="영업부" <%=dept.equals("영업부")?"selected":"" %>>영업부</option>
                            <option value="경리부" <%=dept.equals("경리부")?"selected":"" %>>경리부</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>직급</td>
                    <td>
                        <input type="radio" name="position" value="1" <%=position.equals("1")?"checked":"" %>> 1급
                        <input type="radio" name="position" value="2" <%=position.equals("2")?"checked":"" %>> 2급
                        <input type="radio" name="position" value="3" <%=position.equals("3")?"checked":"" %>> 3급
                        <input type="radio" name="position" value="4" <%=position.equals("4")?"checked":"" %>> 4급
                        <input type="radio" name="position" value="5" <%=position.equals("5")?"checked":"" %>> 5급
                    </td>
                </tr>
                <tr>
                    <td>호봉</td>
                    <td>
                        <select name="hobong" value="<%=hobong%>">
                            <option value="1" <%=hobong.equals("1")?"selected":"" %>>1호봉</option>
                            <option value="2" <%=hobong.equals("2")?"selected":"" %>>2호봉</option>
                            <option value="3" <%=hobong.equals("3")?"selected":"" %>>3호봉</option>
                            <option value="4" <%=hobong.equals("4")?"selected":"" %>>4호봉</option>
                            <option value="5" <%=hobong.equals("5")?"selected":"" %>>5호봉</option>
                            <option value="6" <%=hobong.equals("6")?"selected":"" %>>6호봉</option>
                            <option value="7" <%=hobong.equals("7")?"selected":"" %>>7호봉</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>직책</td>
                    <td><input type="text" name="duty" id="in1" value="<%=duty%>"></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td>
                        <input type="text" name="phone1" id="in3" value="<%=ph[0]%>">-
                        <input type="text" name="phone2" id="in3" value="<%=ph[1]%>">-
                        <input type="text" name="phone3" id="in3" value="<%=ph[2]%>">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="emailID" id="in1" value="<%=em[0]%>">@
                        <select name="emailAD">
                            <option value="daum.net" <%=em[1].equals("daum.net")?"selected":"" %>>daum.net</option>
                            <option value="naver.com" <%=em[1].equals("naver.com")?"selected":"" %>>naver.com</option>
                            <option value="nate.com" <%=em[1].equals("nate.com")?"selected":"" %>>nate.com</option>
                            <option value="gmail.com" <%=em[1].equals("gmail.com")?"selected":"" %>>gmail.com</option>
                            <option value="korea.com" <%=em[1].equals("korea.com")?"selected":"" %>>korea.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="address" id="in2" value="<%=address%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button"  id="btn" value="변경" onclick="check()">
                        <input type="reset"  id="btn" value="취소">
                    </td>
                </tr>
            </table>
            <%
        }
            %>
        </form>
    </hr>
    </section>
    <%@ include file="footer2.jsp"%>
</body>
</html>