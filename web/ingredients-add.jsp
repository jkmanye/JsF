<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <link href="css/ingredients-add.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<div>
    <div class="ingredients-add-container">
        <div class="ingredients-add-divlogin">
            <span class="ingredients-add-text12"><span>재료 추가하기</span></span>
            <div class="input_div" style="width: 70vw; left: 0;">
                <input type="text" class="text_input" style="width: 70vw; top: -17vh; text-align: center" list="presets" placeholder="이름 (선택 혹은 직접 입력)">
                <datalist id="presets">
                    <option value="애호박"></option>
                    <option value="두부"></option>
                    <option value="차돌박이"></option>
                    <option value="양파"></option>
                    <option value="우유"></option>
                    <option value="토마토"></option>
                    <option value="계란"></option>
                </datalist>
                <input type="date" class="text_input" style="width: 70vw; top: 0; text-align: center" data-placeholder="소비기한">
            </div>
            <button class="button_confirm" style="top: 40vh">추가</button>
        </div>
        <button class="button_confirm" style="top: 75vh; left: 38vw;">돌아가기</button>
    </div>
</div>
</body>
</html>