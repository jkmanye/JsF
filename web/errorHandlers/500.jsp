<%--
  Created by IntelliJ IDEA.
  User: jkmanye
  Date: 2022/10/03
  Time: 7:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>500 Internal Server Error</title>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=1"/>
    <link rel="stylesheet" href="styles/core.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        h1 {
            text-align: center;
            font-size: xxx-large;
            margin-top: 72px;
        }

        h3 {
            text-align: center;
            margin-top: 72px;
        }

        h6 {
            margin-top: 324px;
            text-align: center;
        }

        center {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="center">
<%--    <h1> 500 Internal Server Error </h1>--%>
<%--    <h3>서버 측 오류가 발생하였습니다.<br/>관리자에게 연락주시면 빠른 시일 내에 조치하겠습니다.<br/>이용에 불편을 드려 죄송합니다.<br /><br /><br /> <a href="/">메인으로 돌아가기</a> </h3>--%>
<%--    <h6>연락처: devmeko463@gmail.com</h6>--%>

    <div class="d-flex align-items-center justify-content-center vh-100">
        <div class="text-center">
            <h1 class="display-1 fw-bold">500</h1>
            <p class="fs-3"> <span class="text-danger">500</span> Internal Server Error</p>
            <p class="lead">
                서버 측 오류가 발생하였습니다.<br/>관리자에게 연락주시면<br />빠른 시일 내에 조치하겠습니다.<br/><br/>이용에 불편을 드려 죄송합니다.<br /><br /><br />
            </p>
            <a href="/" class="btn btn-primary">메인으로 돌아가기</a>
        </div>
    </div>
</div>
</body>
</html>
