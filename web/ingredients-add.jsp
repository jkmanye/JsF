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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<div>
    <div class="ingredients-add-container">
        <div class="ingredients-add-divlogin">
            <span class="ingredients-add-text12"><span>재료 추가하기</span></span>
            <div class="input_div" style="width: 70vw; left: 0;">
                <input type="text" id="type" class="text_input" style="width: 70vw; top: -17vh; text-align: center" list="presets" placeholder="이름 (선택 혹은 직접 입력)">
                <datalist id="presets">
                    <option value="애호박"></option>
                    <option value="두부"></option>
                    <option value="차돌박이"></option>
                    <option value="양파"></option>
                    <option value="우유"></option>
                    <option value="토마토"></option>
                    <option value="계란"></option>
                </datalist>
                <input type="date" class="text_input" id="date" style="width: 70vw; top: 0; text-align: center" data-placeholder="소비기한">
            </div>
            <a href='javascript:addIngredient();' class="button_confirm" style="top: 40vh">추가</a>
        </div>
        <a href='javascript:window.location.href = "/ingredientsView";' class="button_confirm" style="top: 75vh; left: 38vw;">돌아가기</a>
    </div>
</div>
<script type="text/javascript">
    function addIngredient() {
        document.getElementsByClassName('ingredients-add-divlogin')[0].append(new DOMParser().parseFromString('<div class="loader-container" id="loading" style="height: 100vh;"><div class="spinner"></div></div>', 'text/html').body.firstChild);

        $.ajax({
            url: "/api/ingredients",
            dataType: "json",
            processData: false,
            method: "POST",
            data: JSON.stringify({
                action: "add",
                fridgeCode: new URL(window.location).searchParams.get("fridgeCode"),
                type: document.getElementById("type").value,
                date: document.getElementById("date").value
            }),
            success: function (json) {
                window.location.href = "/ingredientsView" + window.location.search;
                document.getElementById("loading").remove();
            },
            error: function () {
                console.log("AJAX error!");
            }
        });
    }
</script>
</body>
</html>