<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
<%--    <link href="css/nav-bar.css" rel="stylesheet"/>--%>
    <link href="css/recipe.css" rel="stylesheet"/>
    <link href="css/fridge-view.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body style="height: 10000vh; background-color: #222222;">
<script type="text/javascript" src="scripts/core.js"></script>

<iframe id="iframe" src="https://www.10000recipe.com/recipe/list.html?q=%EB%8B%B9%EA%B7%BC+%EC%96%91%ED%8C%8C+%EB%A7%88%EB%8A%98"></iframe>

<div>
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
        <a href="/recipe" class="nav-bar-navrecipe">
            <img
                    src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/78ea5ae3-a97c-4084-96d5-b9a57792d3d7?org_if_sml=1704"
                    alt="recipe29025"
                    class="nav-bar-recipe2"
            />
        </a>
        <a href='/accountView' class="nav-bar-navaccount" style="background-color: #00000000;">
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

<script type="text/javascript">
    document.getElementById("iframe").src = "https://www.10000recipe.com/recipe/list.html?q=" + (new URL(window.location).searchParams.get("queryString") == null ? "" : new URL(window.location).searchParams.get("queryString"));
</script>
</body>
</html>