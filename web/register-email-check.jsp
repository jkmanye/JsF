<%@ page import="xyz.devmeko.JsF.Handlers.RandomStringGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <link rel="stylesheet" href="css/core.css"/>
    <link href="css/captcha-confirmation.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    String sessionID = new RandomStringGenerator().generate(6);

    if (request.getParameter("sessionID") != null) {
        if (session.getAttribute(request.getParameter("sessionID")).equals("1")) {
            session.setAttribute(request.getParameter("sessionID"), request.getParameter("email"));
            response.sendRedirect("./register?sessionID=" + request.getParameter("sessionID"));
        }
    } else {
        request.setAttribute("sessionID", sessionID);
        session.setAttribute(sessionID, "0");
    }
%>

<div>
    <div class="captcha-confirmation-container">
        <div class="captcha-confirmation-captcha-confirmation">
            <div class="captcha-confirmation-divcaptchacode">
                <span class="captcha-confirmation-text">
                  <span>
                    <span>시작 전,</span>
                    <br/>
                    <span>먼저 이메일을 입력해주세요.</span>
                  </span>
                </span>
                <form action="captchaConfirmation" method="get">
                    <input type="submit" class="button_confirm" style="top: 50vh;" placeholder="인증 코드 받기 /">
                    <div class="input_div">
                        <input class="text_input" type="text" name="email"
                               id="email" placeholder="이메일" />
                    </div>
                    <input type="hidden" required readonly name="sessionID" value="<%= sessionID  %>" style="text-align: center; margin-left: auto; margin-right: auto; width: 95%" />
                </form>
            </div>
        </div>
    </div>
</div>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#failModal" style="display: none;" id="modalCall"></button>

<div class="modal fade" id="failModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #222222">
            <div class="modal-header" style="font-weight: bold; color: #FFFFFF">
                인증 실패
            </div>
            <div class="modal-body" style="color: #FFFFFF">
                잘못된 인증번호입니다. 다시 시도해주세요.<br>
                (보안상의 이유로 지금까지의 인증번호는 모두 무효화됩니다.)
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    window.onload = function () {
        if (Object.is(new URLSearchParams(window.location.search).get("failed"), "true")) {
            document.getElementById("modalCall").click();
        }
    };
</script>
</body>
</html>