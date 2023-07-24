<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<html>
<head>
    <title>JsF</title>
    <meta charset="UTF-8"/>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"/>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/core.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="scripts/core.js"></script>
<div>
    <div class="login-container">
        <div class="login-login">
            <div class="login-divlogin">
                <div class="login-container1">
                    <span class="login-text">로그인해주세요.</span>
                    <a href='javascript:window.location.href = "/registerEmailCheck";' class="login-btnlogintoregister">
                        <span class="login-text02">계정이 없으신가요? 회원가입하기</span>
                    </a>
                    <a href='javascript:login();' class="login-btnlogin">
                        <span class="login-text04">로그인</span>
                    </a>
                    <div class="input_div">
                        <input class="text_input" id="email" type="email" placeholder="이메일" style="top: 0vh; left: -15vw;">
                    </div>
                    <div class="input_div">
                        <input class="text_input" id="password" type="password" placeholder="비밀번호" style="top: 15vh; left: -15vw;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    window.onload = function () {
        if (! Object.is(getCookie("logout"), "true")) {
            console.log("Auto Login!");
            document.getElementById("email").value = getCookie("email");
            document.getElementById("password").value = getCookie("password");
            login();
        }
    }

    function login() {
        document.getElementsByClassName('login-login')[0].append(new DOMParser().parseFromString('<div class="loader-container" id="loading" style="100vh"><div class="spinner"></div></div>', 'text/html').body.firstChild);

        $.ajax({
            url: "/api/user",
            method: "POST",
            dataType: "json",
            processData: false,
            data: JSON.stringify({
                action: "login",
                email: document.getElementById("email").value,
                password: document.getElementById("password").value
            }),
            success: function (json) {
                window.sessionStorage.setItem("accountEmail", json.email);
                window.sessionStorage.setItem("accountName", json.name);

                deleteCookie("logout");
                setCookie("logout", "false");
                setCookie("email", document.getElementById("email").value , 720);
                setCookie("password", document.getElementById("password").value , 720);

                document.getElementById("loading").remove();

                if (Object.is(new URL(window.location).searchParams.get("redirect"), null)) {
                    window.location.href = "/mainMenu";
                } else window.location.href = ("/" + new URL(window.location).searchParams.get("redirect"));
            },
            error: function () {
                console.log("AJAX error!");
            }
        })
    }
</script>
</body>
</html>
