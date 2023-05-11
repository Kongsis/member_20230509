<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <form action="/member/login" method="post">
            <input type="text" id="email-check" onblur="loginEmail_check()" name="memberEmail" placeholder="이메일">
            <h6 id="email-reResult"></h6> <br>
            <input type="text" id="password-check" onblur="loginPassword_check()" name="memberPassword" placeholder="비밀번호">
            <h6 id="password-reResult"></h6> <br>
            <input type="submit" onclick="login_check()" value="로그인">
        </form>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const loginEmail_check = () => {
        const email = document.getElementById("email-check").value;
        const result = document.getElementById("email-reResult");
        if(email.length == 0) {
            result.innerHTML = "필수입력입니다.";
            result.style.color = "red";
        } else {
            result.style.display = "none";
        }
    }

    const loginPassword_check = () => {
        const password = document.getElementById("password-check").value;
        const result = document.getElementById("password-reResult");
        if(password.length == 0) {
            result.innerHTML = "필수입력입니다.";
            result.style.color = "red";
        } else {
            result.style.display = "none";
        }
    }

    // const login_check = () => {
    //     const email = document.getElementById("email-check").value;
    //     const password = document.getElementById("password-check").value;
    //     $.ajax({
    //         type: "post",
    //         url: "/member/login-check",
    //         data: {
    //             "memberEmail": email,
    //             "memberPassword": password
    //         },
    //         success: function () {
    //             // alert("로그인");
    //         },
    //         error: function () {
    //             alert("아이디 또는 비밀번호가 일치하지 않습니다.");
    //         }
    //     })
    // }
</script>
</html>
