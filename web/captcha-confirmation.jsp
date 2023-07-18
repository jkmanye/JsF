<%@ page import="xyz.devmeko.JsF.Handlers.EmailHandler" %>
<%@ page import="xyz.devmeko.JsF.Handlers.CaptchaHandler.CaptchaCodes" %>
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
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    for(String key : request.getParameterMap().keySet()) {
        System.out.println("captchaConfirm: " + key + " : " + request.getParameter(key));
    }

    if (request.getParameter("code") != null) {
        System.out.println(new CaptchaCodes().captchaCodes.get(request.getParameter("email")));
        if (request.getParameter("code").equalsIgnoreCase(CaptchaCodes.captchaCodes.get(request.getParameter("email")))) {
            System.out.println("success");
            session.setAttribute(request.getParameter("sessionID"), "1");
            System.out.println(request.getAttribute("sessionID"));
            System.out.println(request.getParameter("sessionID"));
            response.sendRedirect("./registerEmailCheck?sessionID=" + request.getParameter("sessionID") + "&email=" + request.getParameter("email"));
        } else {
            System.out.println("wrong");
            session.invalidate();
            response.sendRedirect("./registerEmailCheck?failed=true");
        }
    } else {
        String code = new RandomStringGenerator().generate(6);

        if (new CaptchaCodes().captchaCodes.containsKey(request.getParameter("email"))) {
            CaptchaCodes.captchaCodes.remove(request.getParameter("email"));
        }
        CaptchaCodes.captchaCodes.put(request.getParameter("email"), code);

        new EmailHandler().sendCaptchaMail(request.getParameter("email"), code);
        System.out.println(code);
    }
%>
<div>
    <div class="captcha-confirmation-container">
        <div class="captcha-confirmation-captcha-confirmation">
            <div class="captcha-confirmation-divcaptchacode">
                <span class="captcha-confirmation-text">
                  <span>
                    <span>이메일로 발송된 인증 코드</span>
                    <br/>
                    <span>6자리를 입력해주세요.</span>
                  </span>
                </span>
                <form action="captchaConfirmation" method="get">
                    <input type="submit" value="인증 코드 확인" class="button_confirm" style="top: 50vh;" />
                    <div class="input_div">
                        <input class="text_input" type="text" id="code" name="code" placeholder="인증 코드">
                    </div>
                    <input type="hidden" readonly name="email" id="registerEmail" />
                    <input type="hidden" readonly required id="sessionID" name="sessionID" value=<%= request.getParameter("sessionID") %>>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    window.onload = function () {
        document.getElementById("registerEmail").setAttribute("value", new URLSearchParams(window.location.search).get("email"));
        document.getElementById("sessionID").setAttribute("value", new URLSearchParams(window.location.search).get("sessionID"));
        if (! (Object.is(new URLSearchParams(window.location.search).get("code"), null))) {
            document.getElementById("code").setAttribute("value", new URLSearchParams(window.location.search).get("code"));
        }
    }
</script>
</body>
</html>