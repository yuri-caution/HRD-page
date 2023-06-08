<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>호봉 수정</title>
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
        <%@ include file="dbconn.jsp" %>
    <%
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        String position=request.getParameter("position");
        String hobong=request.getParameter("hobong");
        String sql="select position, hobong, salary from hobong where position=? and hobong=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, position);
        pstmt.setString(2, hobong);
        rs=pstmt.executeQuery();
        String salary="";
        if(rs.next()){
            position=rs.getString("position");
            hobong=rs.getString("hobong");
            salary=rs.getString("salary");
        }
    %>  



        <h1>인사관리 호봉 수정 화면</h1>
        <form name="frm" method="get" action="updateHobongProcess.jsp">
            <table border="1", id="tab1">
                <tr>
                    <td>직급</td>
                    <td>
                        <select name="position">
                            <option value="1" <%=position.equals("1")?"selected":"" %>>1급</option>
                            <option value="2" <%=position.equals("2")?"selected":"" %>>2급</option>
                            <option value="3" <%=position.equals("3")?"selected":"" %>>3급</option>
                            <option value="4" <%=position.equals("4")?"selected":"" %>>4급</option>
                            <option value="5" <%=position.equals("5")?"selected":"" %>>5급</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>호봉</td>
                    <td>
                        <select name="hobong">
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
                    <td>급여</td>
                    <td><input type="text" name="salary" value="<%=salary%>"></td>
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