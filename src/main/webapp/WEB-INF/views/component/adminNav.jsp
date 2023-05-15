<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="nav">
    <ul>
        <li>
            <a href="/">
                <i class="bi bi-house"></i>
            </a>
        </li>
        <li>
            <a href="#">회원등록</a>
        </li>
        <li>
            <a onclick="findAll()">회원목록 조회/수정</a>
        </li>
        <li>
            <a href="#">홈으로</a>
        </li>
    </ul>
</div>

<%--<script>--%>
<%--  const loginArea = document.getElementById("login-area");--%>
<%--  const loginEmail = '${sessionScope.loginEmail}';--%>
<%--  console.log(loginEmail.length);--%>
<%--  if (loginEmail.length != 0) {--%>
<%--    loginArea.innerHTML = "<a href='/member/myPage' style='color: black;'>"+loginEmail +"님 환영해요!</a>"+--%>
<%--            "<a href='/member/logout'>logout</a>";--%>
<%--  } else {--%>
<%--    loginArea.innerHTML = "<a href='/member/login'>login</a>";--%>
<%--  }--%>
<%--</script>--%>