<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <link href="css/main-menu.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="scripts/core.js"></script>
<div>
    <div class="main-menu-container">
        <div class="main-menu-main-menu">
            <div class="main-menu-divnotice">
                <span class="main-menu-text" id="text"><span>소비기한 임박 식재료<br><br><br></span></span>
            </div>
            <div class="nav-bar-nav-bar">
                <div class="nav-bar-container">
                    <a href="/mainMenu" class="nav-bar-navhome">
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
        </div>
    </div>
</div>

<script type="text/javascript">
    window.onload = function () {
        document.getElementsByClassName('main-menu-main-menu')[0].append(new DOMParser().parseFromString('<div class="loader-container" id="loading"><div class="spinner"></div></div>', 'text/html').body.firstChild);

        $.ajax({
            url: "/api/user",
            dataType: "json",
            data: JSON.stringify({action: "getFridge", email: window.sessionStorage.getItem("accountEmail")}),
            method: "POST",
            processData: false,
            success: function (json) {
                console.log(json);
                let fridgeArray = json.fridges.split(',');
                fridgeCodesArray = fridgeArray.filter((item) => !Object.is(item, ''));

                for (const code of fridgeCodesArray) {
                    $.ajax({
                        url: "/api/fridge",
                        dataType: "json",
                        processData: false,
                        method: "POST",
                        data: JSON.stringify({
                            action: "get",
                            fridgeCode: code
                        }),
                        success: function (value) {
                            console.log(JSON.stringify(json));

                            $.ajax({
                                url: "/api/ingredients",
                                method: "POST",
                                dataType: "json",
                                processData: false,
                                data: JSON.stringify({
                                    action: "get",
                                    fridgeCode: value.code
                                }),
                                success: function (json) {
                                    let length = 0;
                                    let finalString = "";

                                    for (var index in json) {
                                        length++;

                                        const yyyyMMdd = json[index].expireDate;
                                        const sYear = yyyyMMdd.substring(0, 4);
                                        const sMonth = yyyyMMdd.substring(5, 7);
                                        const sDate = yyyyMMdd.substring(8, 10);

                                        if ((Math.ceil((new Date(Number(sYear), Number(sMonth) - 1, Number(sDate)).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24))) <= 7) {
                                            finalString = json[index].type + " (" + value.name + "):<br>" + (Math.ceil((new Date(Number(sYear), Number(sMonth) - 1, Number(sDate)).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24))) + "일 남음<br><br>" + finalString;
                                        }
                                    }

                                    document.getElementById("text").innerHTML += finalString;
                                    document.getElementById("loading").remove();
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
            },
            error: function () {
                console.log('AJAX Error!');
            }
        });
    };
</script>
</body>
</html>