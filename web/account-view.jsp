<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <%--    <link rel="stylesheet" href="styles/login.css"/>--%>
    <link href="css/account-view.css" rel="stylesheet"/>
    <link href="css/fridge-view.css" rel="stylesheet"/>
    <link href="css/ingredients-view.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="scripts/core.js"></script>
<div class="fridge-management-container">
    <div class="fridge-management-fridge-management">
        <div class="fridge-management-divfridgemanage">
            <div class="fridge-management-container1">
                <img
                        src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/6f676c02-2824-4bdf-8760-2a2e8a663d67?org_if_sml=1902"
                        alt="imgfridge1803"
                        class="fridge-management-imgfridge"
                />
                <span class="fridge-management-text" id="fridgeName"><span>회원 정보</span></span>
                <div class="fridge-management-properties">
                    <span class="fridge-management-text06">이메일</span>
                    <span class="fridge-management-text08">이름</span>
                    <span class="fridge-management-text14" id="email"></span>
                    <span class="fridge-management-text16" id="name"></span>
                </div>
            </div>
        </div>

        <div class="nav-bar-container">
            <div class="nav-bar-nav-bar">
                <a href="/mainMenu" class="nav-bar-navhome" style="background-color: #00000000;">
                    <img
                            src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/5927e201-d88a-4e43-878d-5b3d6062ecb3?org_if_sml=1548"
                            alt="home29025"
                            class="nav-bar-home2"
                    />
                </a>
                <a href="/fridgeView" class="nav-bar-navfridge" style="background-color: #00000000;">
                    <img
                            src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/fba88ca1-98f5-4ab4-a593-3d87d244604c?org_if_sml=1563"
                            alt="fridge39024"
                            class="nav-bar-fridge3"
                    />
                </a>
                <a href="/recipe" class="nav-bar-navrecipe" style="background-color: #00000000;">
                    <img
                            src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/78ea5ae3-a97c-4084-96d5-b9a57792d3d7?org_if_sml=1704"
                            alt="recipe29025"
                            class="nav-bar-recipe2"
                    />
                </a>
                <a href='/accountView' class="nav-bar-navaccount">
                    <img
                            src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/6f676c02-2824-4bdf-8760-2a2e8a663d67?org_if_sml=1902"
                            alt="account29025"
                            class="nav-bar-account2"
                    />
                </a>
                <a href="javascript:logout(true);" class="nav-bar-navquit" style="background-color: #00000000;">
                    <img
                            src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/c8189b06-60d4-4e4b-8d65-6102d81fc534?org_if_sml=1575"
                            alt="leave29025"
                            class="nav-bar-leave2"
                    />
                </a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    let fridgeCode;

    window.onload = function () {
        document.getElementById("email").innerText += (" " + sessionStorage.getItem("accountEmail"));
        document.getElementById("name").innerText += (" " + sessionStorage.getItem("accountName"));
    };
</script>
</body>
</html>
