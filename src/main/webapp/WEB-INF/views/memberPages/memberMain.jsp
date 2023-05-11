<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-11
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div id="section">
    ${sessionScope.loginEmail} 님 환영해요!
    <button onclick="logout()">로그아웃</button>
    <button onclick="fun1()">세션값 js에서 확인</button>
    <button onclick="update()">회원정보수정</button>

    <%-- 수정요청은 memberMain.jsp에서 시작
         컨트롤러에서 세션값 가져올 때: session.getAttribute("loginEmail")
         수정페이지(memberUpdate.jsp)에서 이름, 전화번호만 수정
         그리고 비밀번호 입력칸은 비워두고 사용자 입력을 받아서
         기존 비밀번호와 일치하면 수정처리, 일치하지 않으면 alert으로 비밀번호 불일치 출력 --%>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>
    const logout = () => {
        location.href = "/member/logout";
    }

    const fun1 = () => {
        const loginEmail = '${sessionScope.loginEmail}';
        console.log("로그인이메일: ", loginEmail);
    }

    const update = () => {
        location.href = "/member/update";
    }
</script>
</html>
