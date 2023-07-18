<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JsF</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <link href="css/register.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<div>
    <div class="register-container">
        <div class="register-register">
            <div class="register-divregister">
                <div class="register-container1">
                    <span class="register-text"><span>회원가입</span></span>
                    <button id="submit" class="register-btnregister" onclick="register()">
                        회원가입 완료
                    </button>
                    <div class="register-email">
                        <input class="register-text04" id="email" readonly type="text" value=<%= session.getAttribute(request.getParameter("sessionID")) %> style="color: #FFFFFF;">
                    </div>
                    <div class="register-password">
                        <input class="register-text04" id="password" type="password" placeholder="비밀번호">
                    </div>
                    <div class="progress"
                         style="width: 60vw; margin-left: auto; margin-right: auto; margin-top: 42vh; margin-bottom: 10px;">
                        <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="25"
                             aria-valuemin="0" aria-valuemax="100" id="pgBar"></div>
                    </div>
                    <p class="register-text02"
                       style="position: absolute; font-size: 16px; width: 60vw; margin-left: 10vw; text-align: center; margin-top: 36vh;"
                       id="pwStrength">비밀번호를 입력해주세요!</p>
                    <div class="register-password-confirm">
                        <input class="register-text04" id="password_check" type="password" placeholder="비밀번호 확인">
                    </div>
                    <p class="register-text02"
                       style="position: absolute; font-size: 14px; width: 60vw; margin-left: 10vw; text-align: center; margin-top: 57vh;"
                       id="pwCheck">비밀번호를 한 번 더 입력해주세요!</p>
                    <div class="register-name">
                        <input class="register-text04" id="name" type="text" placeholder="이름">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    let regexLower = new RegExp('(?=.*[a-z])');
    let regexUpper = new RegExp('(?=.*[A-Z])');
    let regexDigits = new RegExp('(?=.*[0-9])');
    let regexLength = new RegExp('(?=.{6,})');
    let pwQ = false;
    let ableToProceed = false;

    window.onload = function () {
        document.getElementById("password").oninput = function () {
            var score = 0;
            document.getElementById("submit").setAttribute("disabled", "disabled");

            var curPassword = document.getElementById("password").value;

            if (!Object.is(curPassword, null)) {
                if (curPassword.match(regexLower)) {
                    ++score
                }
                if (curPassword.match(regexUpper)) {
                    ++score
                }
                if (curPassword.match(regexDigits)) {
                    ++score
                }
                if (curPassword.match(regexLength)) {
                    ++score
                }

                switch (score) {
                    case 4:
                        document.getElementById("pgBar").style.width = "100%";
                        document.getElementById("pwStrength").innerText = "강력한 비밀번호입니다!";
                        pwQ = true;
                        break;
                    case 3:
                        document.getElementById("pgBar").style.width = "75%";
                        document.getElementById("pwStrength").innerText = "적당한 비밀번호입니다!";
                        pwQ = true;
                        break;
                    case 2:
                        document.getElementById("pgBar").style.width = "50%";
                        document.getElementById("pwStrength").innerText = "약한 비밀번호입니다!";
                        pwQ = false;
                        break;
                    case 1:
                        document.getElementById("pgBar").style.width = "25%";
                        document.getElementById("pwStrength").innerText = "매우 약한 비밀번호입니다!";
                        pwQ = false;
                        break;
                    default:
                        document.getElementById("pgBar").style.width = "0%";
                        document.getElementById("pwStrength").innerText = "비밀번호를 입력해주세요!";
                        pwQ = false;
                }
            } else {
                document.getElementById("pgBar").style.width = "0%";
                document.getElementById("pwStrength").innerText = "비밀번호를 입력해주세요!";
                pwQ = false;
                document.getElementById("submit").setAttribute("disabled", "disabled");
            }
        };

        document.getElementById("password_check").oninput = function () {
            if (!Object.is(document.getElementById("password_check").value, '')) {
                if (Object.is(document.getElementById("password_check").value, document.getElementById("password").value)) {
                    document.getElementById("pwCheck").innerText = "입력한 비밀번호가 일치합니다!";
                } else document.getElementById("pwCheck").innerText = "입력한 비밀번호가 일치하지 않습니다!";
            } else document.getElementById("pwCheck").innerText = "비밀번호를 한 번 더 입력해주세요!";
        }

        document.getElementById("name").oninput = function () {
            if (Object.is(document.getElementById("name"), '')) document.getElementById("submit").setAttribute("disabled", "disabled");
            else document.getElementById("submit").removeAttribute('disabled');
        }
    };

    function check() {
        if (pwQ) {
            if (!Object.is(document.getElementById("name").value, '')) {
                if (!Object.is(document.getElementById("password_check").value, '')) {

                }
            }
        }
    }

    function register() {
        $.ajax({
            url: "/api/user",
            dataType: "json",
            data: JSON.stringify({email: document.getElementById("email").value, password: document.getElementById("password").value, name: document.getElementById("name").value, action: "register"}),
            method: "POST",
            processData: false,
            success: function (json) {
                document.cookie = "email=" + document.getElementById("email").value + ";password=" +

                window.sessionStorage.setItem("accountEmail", json.email);
                window.location.href = "/mainMenu"
            },
            error: function () {

            }
        });
    }
</script>
</body>
</html>