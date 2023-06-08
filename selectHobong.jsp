<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="./css/style2.css">
    <script>
        function onchangesubmit(){
            form.submit();
        }
    </script>
</head>
<body>
    <%@ include file="header2.jsp"%>
    <%@ include file="nav2.jsp"%>
    <%@ include file="dbconn.jsp"%>

    <section>
        <hr>
        <form method="post" name="form" action="selectHobong.jsp">
            <h1>호봉 정보 조회</h1>
            
            <table border="1" id="tab3">

                <%
                    String position=request.getParameter("position");
                    if(position==null){
                        position="1";
                    }
                %>
                <tr>
                    <td colspan="2">직급선택</td>
                    <td colspan="3">
                        <select name="position" value="<%=position%>" onchange="onchangesubmit()">
                            <option value="1" <%=position.equals("1")?"selected":""%>>1급</option>
                            <option value="2" <%=position.equals("2")?"selected":""%>>2급</option>
                            <option value="3" <%=position.equals("3")?"selected":""%>>3급</option>
                            <option value="4" <%=position.equals("4")?"selected":""%>>4급</option>
                            <option value="5" <%=position.equals("5")?"selected":""%>>5급</option>
                        </select>
                    </td>
                </tr>
                <tr align="center">
                    <td>no</td>
                    <td>직급</td>
                    <td>호봉</td>
                    <td>급여</td>
                    <td>구분</td>
                </tr>
                <%
                    PreparedStatement pstmt=null;
                    ResultSet rs=null;
                    String sql="select position, hobong, salary from hobong where position=?";
                    pstmt=conn.prepareStatement(sql);
                    pstmt.setString(1, position);
                    rs=pstmt.executeQuery();
                    int num = 0;
                    while(rs.next()){
                        position=rs.getString(1);
                        String hobong=rs.getString(2);
                        String salary=rs.getString(3);  
                        num++;
                    %>
                    <tr>
                        <td><%=num%></td>
                        <td align="center"><%=position%>급</td>
                        <td align="center"><%=hobong%>호봉</td>
                        <td><%=salary%></td>
                        <td align="center">
                            <a href="updateHobong.jsp?position=<%=position%>&hobong=<%=hobong%>">수정</a> /
                            <a href="deleteHobong.jsp?position=<%=position%>&hobong=<%=hobong%>">삭제</a>
                        </td>
                    </tr>
                    <%
                    }
                %>
            </table>
        </form>
    </section>
    <%@ include file="footer2.jsp"%>
</body>
</html>