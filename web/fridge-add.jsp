<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Title</title>
    <link href="css/fridge-add.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet" />
</head>
<body>
<div>
    <div class="fridge-add-container">
        <div class="fridge-add-fridge-add">
            <div class="fridge-add-divregister-email-check">
                <span class="fridge-add-text"><span>코드로 등록하기</span></span>
                <button class="button_confirm" style="top: 22vh;">냉장고 등록</button>
                <div class="input_div">
                    <input class="text_input" type="text" id="registerFridge" placeholder="코드" style="top: -17vh">
                </div>
            </div>
            <div class="fridge-add-divregister-email-check" style="top: 40vh">
                <span class="fridge-add-text"><span>새로운 냉장고 추가하기</span></span>
                <button class="button_confirm" style="top: 22vh;">냉장고 추가</button>
                <div class="input_div">
                    <input class="text_input" type="text" id="addFridge" placeholder="이름" style="top: -17vh">
                </div>
            </div>
            <button class="button_confirm" style="top: 75vh; left: 38vw;">돌아가기</button>
        </div>
    </div>
</div>

</body>
</html>