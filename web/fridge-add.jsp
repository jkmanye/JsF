<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <link href="css/fridge-add.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet" />
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<div>
    <div class="fridge-add-container">
        <div class="fridge-add-fridge-add">
            <div class="fridge-add-div">
                <span class="fridge-add-text"><span>코드로 등록하기</span></span>
                <button class="button_confirm" style="top: 22vh;" onclick="addExisting()">냉장고 등록</button>
                <div class="input_div">
                    <input class="text_input" id="existing" type="text" id="registerFridge" placeholder="코드" style="top: -17vh">
                </div>
            </div>
            <div class="fridge-add-div" style="top: 40vh">
                <span class="fridge-add-text"><span>새로운 냉장고 추가하기</span></span>
                <button class="button_confirm" style="top: 22vh;" onclick="addNew()">냉장고 추가</button>
                <div class="input_div">
                    <input class="text_input" type="text" id="new" placeholder="이름" style="top: -17vh">
                </div>
            </div>
            <a href="/fridgeView" class="button_confirm" style="top: 75vh; left: 38vw;">돌아가기</a>
        </div>
    </div>
</div>
<script>
    function addExisting() {
        $.ajax({
            url: "/api/fridge",
            method: "POST",
            dataType: "json",
            processData: false,
            data: JSON.stringify({
                action: "get",
                fridgeCode: document.getElementById("existing").value
            }),
            success: function (json) {
                // alert("Existing Query JSON: " + JSON.stringify(json));
                if (!Object.is(JSON.stringify(json), '{}')) {
                    $.ajax({
                        url: "/api/user",
                        method: "POST",
                        dataType: "json",
                        processData: false,
                        data: JSON.stringify({
                            action: "addFridge",
                            email: window.sessionStorage.accountEmail,
                            fridgeCode: document.getElementById("existing").value
                        }),
                        success: function (json) {
                            window.location.href = "/fridgeView";
                        },
                        error: function () {
                            console.log("AJAX error!");
                        }
                    });
                } else alert("존재하지 않는 냉장고입니다. 코드를 확인해주세요.");
            },
            error: function () {
                console.log("AJAX error!");
            }
        });
    }

    function addNew() {
        $.ajax({
            url: "/api/fridge",
            method: "POST",
            dataType: "json",
            processData: false,
            data: JSON.stringify({
                action: "add",
                fridgeName: document.getElementById("new").value
            }),
            success: function (json) {
                $.ajax({
                    url: "/api/user",
                    method: "POST",
                    dataType: "json",
                    processData: false,
                    data: JSON.stringify({
                        action: "addFridge",
                        email: window.sessionStorage.accountEmail,
                        fridgeCode: json.fridgeCode
                    }),
                    success: function (json) {
                        window.location.href = "/fridgeView";
                    },
                    error: function () {
                        console.log("AJAX error!");
                    }
                });
            },
            error: function () {
                console.log("AJAX error!");
            }
        });
    }
</script>
</body>
</html>