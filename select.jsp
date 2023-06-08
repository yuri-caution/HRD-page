<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="./css/style2.css">
</head>
<body>
    <%@ include file="header2.jsp"%>
    <%@ include file="nav2.jsp"%>
    <%@ include file="dbconn.jsp"%>
    
    <section>
        <h1>직원 정보 조회</h1>
        <table border="1" id="tab2">
            <tr>
                <td>no</td>
                <td>사번</td>
                <td>성명</td>
                <td>비밀번호</td>
                <td>직급</td>
                <td>호봉</td>
                <td>직책</td>
                <td>연락처</td>
                <td>이메일</td>
                <td>주소</td>
                <td>소속부서</td>
            </tr>
            <%
                PreparedStatement pstmt=null;
                ResultSet rs=null;
                String sql="select * from person";
                pstmt=conn.prepareStatement(sql);
                rs=pstmt.executeQuery();
                int num = 0;
                while(rs.next()){
                    String id=rs.getString(1);
                    String name=rs.getString(2);
                    String password=rs.getString(3);
                    String position=rs.getString(5);
                    String hobong=rs.getString(6);
                    String duty=rs.getString(7);
                    String phone=rs.getString(8);
                    String email=rs.getString(9);
                    String address=rs.getString(10);
                    String dept=rs.getString(4);
                    num++;
                    


                    %>
                    <tr>
                        <td><%=num%></td>
                        <td><a href="update.jsp?id=<%=id%>"><%=id%></a></td>
                        <td><%=name%></td>
                        <td><%=password%></td>
                        <td><%=position%></td>
                        <td><%=hobong%></td>
                        <td><%=duty%></td>
                        <td><%=phone%></td>
                        <td><%=email%></td>
                        <td><%=address%></td>
                        <td><%=dept%></td>
                    </tr>
                    <%
                }
                    %>
                </table>
    </section>
    <%@ include file="footer2.jsp"%>
    
</body>
</html>