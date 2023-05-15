<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-12
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <table class="table table-dark table-hover">
            <tr>
                <th>id</th>
                <th>이메일</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>조회</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td onclick="member_detail_ajax('${member.id}')"><a href="/member?id=${member.id}">${member.id}</a></td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberMobile}</td>
                    <td>
                        <button onclick="member_detail('${member.id}')">조회</button>
                    </td>
                    <td>
                        <button onclick="member_update('${member.id}')">수정</button>
                    </td>
                    <td>
                        <button onclick="member_delete('${member.id}')">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    <div id="detail-area"></div>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const member_detail_ajax = (id) => {
        const resultArea = document.getElementById("detail-area");
        $.ajax({
            type: "get",
            url: "/detail-ajax",
            data: {
              "id": id
            },
            success: function (res) {
                let result = "<table>";
                result += "<tr>";
                result += "<td>" + res.memberEmail + "</td>";
                result += "<td>" + res.memberPassword + "</td>";
                result += "<td>" + res.memberName + "</td>";
                result += "<td>" + res.memberMobile + "</td>";
                result += "</tr>";
                result += "</table>";
                resultArea.innerHTML = result;
            },
            error: function () {
                alert("일치하는 정보가 없습니다.");
            }
        })
    }

    const member_detail = (id) => {
        location.href = "/member?id="+id;
    }
    const member_update = (id) => {
        location.href = "/update?id="+id;
    }
    const member_delete = (id) => {
        location.href = "/delete?id="+id;
    }
</script>
</html>
