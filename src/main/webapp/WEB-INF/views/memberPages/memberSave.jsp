<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오전 9:46
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
    <form action="/member/save" id="save-form" method="post" enctype="multipart/form-data">
      <input type="text" id="member-email" onblur="email_check()" name="memberEmail" placeholder="이메일">
        <h6 id="email-result"></h6> <br>
      <input type="text" id="member-password" onblur="password_check()" name="memberPassword" placeholder="비밀번호">
        <h6 id="password-result"></h6> <br>
        <input type="text" id="password-confirm" onblur="password_confirm()" placeholder="비밀번호 재확인">
        <h6 id="password-confirm-result"></h6> <br>
      <input type="text" id="member-name" onblur="name_check()" name="memberName" placeholder="이름">
        <h6 id="name-result"></h6> <br>
      <input type="text" id="member-mobile" onblur="mobile_check()" maxlength="11" name="memberMobile" placeholder="전화번호(숫자만입력)">
        <h6 id="mobile-result"></h6> <br>
      <input type="file" id="member_profile" name="memberProfile" multiple> <br>
      <input type="submit" value="가입하기">
    </form>
  </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const email_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("email-result");
        const exp = /^[a-z\d]{6,20}$/;

        $.ajax({
            type: "post",
            url: "/member/email-check",
            data: {
                "member-email": email
            },
            success: function () {
                if (email.length == 0) {
                    result.innerHTML = "필수정보입니다.";
                    result.style.color = "red";
                    return false;
                } else if (email.match(exp)) {
                    result.innerHTML = "사용가능한 이메일입니다.";
                    result.style.color = "green";
                    return true;
                } else {
                    result.innerHTML = "6~20자의 영문 소문자만 사용 가능합니다.";
                    result.style.color = "red";
                    return false;
                }
            },
            error: function () {
                result.innerHTML = "사용중인 이메일입니다.";
                result.style.color = "red";
                return false;
            }
        });
    }

    const password_check = () => {
        const password = document.getElementById("member-password").value;
        const passwordResult = document.getElementById("password-result");
        const exp = /^[a-z\d]{6,20}$/;
        if(password.length == 0) {
            passwordResult.innerHTML = "필수입력입니다.";
            passwordResult.style.color = "red";
        } else if(password.match(exp)) {
            passwordResult.innerHTML = "사용가능한 비밀번호입니다.";
            passwordResult.style.color = "green";
        } else {
            passwordResult.innerHTML = "6~18글자, 영문대/소문자 필수, 숫자 필수, 특수문자 필수(!#$-_)만 가능합니다.";
            passwordResult.style.color = "red";
        }
    }

    const password_confirm = () => {
        const password = document.getElementById("member-password").value;
        const passwordCheck = document.getElementById("password-confirm").value;
        const passwordConfirm = document.getElementById("password-confirm-result");
        if(passwordCheck.length == 0) {
            passwordConfirm.innerHTML = "필수입력입니다.";
            passwordConfirm.style.color = "red";
        } else if (password == passwordCheck) {
            passwordConfirm.innerHTML = "일치합니다.";
            passwordConfirm.style.color = "green";
        } else {
            passwordConfirm.innerHTML = "비밀번호가 일치하지 않습니다.";
            passwordConfirm.style.color = "red";
        }
    }

    const name_check = () => {
        const name = document.getElementById("member-name").value;
        const nameResult = document.getElementById("name-result");
        if(name.length == 0) {
            nameResult.innerHTML = "필수입력입니다."
            nameResult.style.color = "red";
        } else {
            nameResult.style.display = "none";
        }
    }

    const mobile_check = () => {
        const mobile = document.getElementById("member-mobile");
        const num = mobile.value.replace(/-/g, "");
        const mobileResult = document.getElementById("mobile-result");
        const regex = /(\d{3})(\d{4})(\d{4})/;
        if(mobile.value.length == 0) {
            mobileResult.innerHTML = "필수입력입니다.";
            mobileResult.style.color = "red";
        } else if (num.length === 11) {
            mobile.value = num.replace(regex, "$1-$2-$3");
        }
    }

    const saveForm = document.getElementById("save-form");
    saveForm.addEventListener("submit", function (e) {
        e.preventDefault(); // 해당 요소의 기본 동작을 수행하지 않을 때
        // 가입하기 버튼을 아무리 눌러도 서브밋을 막음

        const email = document.getElementById("member-email");
        const password = document.getElementById("member-password");
        const check = document.getElementById("password-confirm");
        const name = document.getElementById("member-name");
        const mobile = document.getElementById("member-mobile");
        if (email.value == "") {
            alert("이메일을 입력하세요");
            email.focus();
        } else if (password.value == "") {
            alert("비밀번호를 입력하세요");
            password.focus();
        }else if(check.value==""){
            alert("비밀번호를 확인해주세요");
            check.focus();
        }else if (name.value == "") {
            alert("이름을 입력하세요");
            name.focus();
        } else if (mobile.value == "") {
            alert("전화번호를 입력하세요");
            mobile.focus();
        } else if (password_check()) {
            alert("비밀번호를 다시입력해주세요 ");
            password.focus();
        } else if (mobile_check()) {
            alert("전화번호를 다시입력해주세요");
            mobile.focus();
        } else {
            saveForm.submit();
        }
    });
</script>
</html>
