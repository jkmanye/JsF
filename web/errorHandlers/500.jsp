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
            color: #FFFFFF;
        }

        h3 {
            text-align: center;
            margin-top: 72px;
            color: #FFFFFF;
        }

        h6 {
            margin-top: 324px;
            text-align: center;
            color: #FFFFFF;
        }

        center {
            text-align: center;
            color: #FFFFFF;
        }
    </style>
</head>
<body style="background-color: #222222">
<div class="center">
    <div class="d-flex align-items-center justify-content-center vh-100">
        <div class="text-center">
            <h1 class="display-1 fw-bold" style="color: #FFFFFF">500</h1>
            <p class="fs-3" style="color: #FFFFFF"> <span class="text-danger">500</span> Internal Server Error</p>
            <p class="lead" style="color: #FFFFFF">
                서버 측 오류가 발생하였습니다.<br/>잠시 후 다시 시도해주세요.
            </p>
            <a href="/JsF" class="btn btn-primary">메인으로 돌아가기</a>
        </div>
    </div>
</div>
</body>
</html>
