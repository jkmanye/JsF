<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<html>
<head>
    <title>JsF</title>
    <meta charset="UTF-8"/>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"/>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<div>
    <div class="login-container">
        <div class="login-login">
            <div class="login-divlogin">
                <div class="login-container1">
                    <span class="login-text"><span>로그인해주세요.</span></span>
                    <div class="login-btnlogintoregister">
            <span class="login-text02">
              <span>계정이 없으신가요? 회원가입하기</span>
            </span>
                    </div>
                    <div class="login-btnlogin">
                        <span class="login-text04"><span>로그인</span></span>
                    </div>
                    <div class="login-email">
                        <img
                                src="/line17616-7qal.svg"
                                alt="Line17616"
                                class="login-line1"
                        />
                        <span class="login-text06"><span>이메일</span></span>
                    </div>
                    <div class="login-password">
                        <img
                                src="/line27717-yjn5.svg"
                                alt="Line27717"
                                class="login-line2"
                        />
                        <span class="login-text08"><span>비밀번호</span></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
