<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<nav>
    <ul>
        <li><a href="select.jsp">사원조회</a></li>
        <li><a href="selectHobong.jsp">호봉조회</a></li>
        <li><a href="select.jsp">수당조회</a></li>
        <li><a href="add.jsp">사원등록</a></li>
        <li><a href="addHobong.jsp">호봉등록</a></li>
        <li><a href="#">수당등록</a></li>
        <li><a href="select.jsp">사원정보변경</a></li>
        <li><a href="delete.jsp">사원퇴사처리</a></li>
        <li><a href="boardList.jsp">게시판</a></li>
        <li><a href="index2.jsp">홈으로</a></li>
        <%
            String checkName = (String)session.getAttribute("s_Name");
            if(checkName==null){
        %>
        <form method="post" name="login" id="login" action="login.jsp">
            <fieldset>
                <label for="ID">회원ID:</label>
                <input type="text" id="id" size="10" name="id" maxlength="10" required="required"/>
                
                <label for="pswd">비밀번호</label>
                <input type="password" id="passwd" name="passwd" size="10" maxlength="10" required="required"/>

                <button type="submit" data-role="button">로그인</button>
            </fieldset>
        </form>
        <%
        } else{ session.setMaxInactiveInterval(100);
        %>
        <span class="right" style="padding: 0px 10px 0 0;" align="right">
        | <%=checkName%>님 환영합니다. |
            <a href="logout.jsp" style="padding: 0px 10px 0 10px;">logout</a> |
        </span>
        <%
         } 
        %>
    </ul>
</nav>