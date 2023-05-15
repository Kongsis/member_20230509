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
      <a href="/member/save">회원가입</a>
    </li>
    <li>
      <a href="/member/login">로그인</a>
    </li>
    <li>
<%--      <a href="/board/list">글목록</a>--%>
      <a href="/board/save">글쓰기</a>
    </li>
    <li>
      <a href="/board/paging">게시판</a>
    </li>
    <li class="login-name" id="login-area">
      <c:choose>
        <c:when test="${sessionScope.loginEmail != null}">
          <a href="/member/myPage?loginEmail=${sessionScope.loginEmail}" style="color: black;">${sessionScope.loginEmail} 님</a>
          <a href="/member/logout">logout</a>
        </c:when>
        <c:otherwise>
          <a href="/member/login">login</a>
        </c:otherwise>
      </c:choose>
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