<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Title</title>
    <link rel="stylesheet" href="css/core.css"/>
    <link href="css/captcha-confirmation.css" rel="stylesheet"/>
</head>
<body>
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
                <button class="button_confirm" style="top: 50vh;">인증 코드 확인</button>
                <div class="input_div">
                    <input class="text_input" type="text" id="captchaCode" placeholder="인증 코드">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>