<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <link rel="stylesheet" href="css/core.css" />
    <link href="css/fridge-view.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<div>
    <div class="fridge-view-container">
        <div class="fridge-view-fridge-view" id="mainView">
            <div class="fridge-view-divfridgeadd">
                <a id="fridgeAddHref" class="fridge-view-text6" href="/fridgeAdd" style="color: #FFFFFF">+</a>
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
                    <a href="/fridgeView" class="nav-bar-navfridge">
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
                    <a href='javascript:alert("준비중입니다. 기다려주세요.");' class="nav-bar-navaccount" style="background-color: #00000000;">
                        <img
                                src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/6f676c02-2824-4bdf-8760-2a2e8a663d67?org_if_sml=1902"
                                alt="account29025"
                                class="nav-bar-account2"
                        />
                    </a>
                    <a href="/mainMenu" class="nav-bar-navquit" style="background-color: #00000000;">
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
    let fridgeCodesArray = [];
    var fridgeCounter = 0;

    function deleteFridge(index) {
        const fullString = document.getElementById("fridge" + index).children[1].innerText;
        const code = fullString.slice(fullString.length - 7, fullString.length - 1);
    }

    function viewFridge(index) {
        const fullString = document.getElementById("fridge" + index).children[1].innerText;
        const code = fullString.slice(fullString.length - 7, fullString.length - 1);
        window.location.href = "/fridgeManagement?fridgeCode=" + code;
    }

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

            for (const value of fridgeCodesArray) {
                console.log('value');
                $.ajax({
                    url: "/api/fridge",
                    dataType: "json",
                    data: JSON.stringify({fridgeCode: value, action: "get"}),
                    method: "POST",
                    processData: false,
                    success: function (json) {
                        console.log(json);
                        const name = json.name;
                        const id = json.code;

                        fridgeCounter += 1;
                        console.log("Fridge Number " + fridgeCounter + ": " + name + ", " + id);

                        let top = 5 + 32.5 * (fridgeCounter - 1);
                        const newFridgeDiv = new DOMParser().parseFromString('<div class="fridge-view-divfridge" id="fridge"><img src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/47b180bd-2678-455c-90c2-18dd2016a5c9?org_if_sml=11443" alt="imgfridge15" class="fridge-view-imgfridge" /> <span class="fridge-view-text"><span>문종건의 냉장고</span></span> <a class="fridge-view-btnviewmore" style="color: #FFFFFF" href="javascript:viewFridge(' + fridgeCounter + ');" class="fridge-view-text2">자세히 보기</a></div>', 'text/html').firstChild.lastChild.lastChild;
                        newFridgeDiv.id = "fridge" + fridgeCounter;
                        newFridgeDiv.children[1].innerHTML = name + "\n(" + id + ")";
                        newFridgeDiv.style.top = top.toString() + "vh";
                        console.log(newFridgeDiv);
                        document.getElementById("mainView").append(newFridgeDiv);
                        console.log(newFridgeDiv.id + " Added!");
                        document.getElementsByClassName("fridge-view-divfridgeadd")[0].style.top = (32.5 * fridgeCounter + 5) + "vh";
                        document.getElementsByClassName("fridge-view-container")[0].style.height = "calc(20vw + " + Math.max(100, (32.5 * fridgeCounter + 18)) + "vh)";
                        document.getElementsByClassName("fridge-view-fridge-view")[0].style.height = "calc(20vw + " + Math.max(100, (32.5 * fridgeCounter + 18)) + "vh)";
                    },
                    error: function () {
                        console.log('AJAX Error!');
                    }
                });
            }

            if (Object.is(fridgeCounter, 0)) {
                document.getElementsByClassName("fridge-view-divfridgeadd")[0].style.top = "5vh";
                document.getElementsByClassName("fridge-view-container")[0].style.height = Math.max(100, (40 * fridgeCounter)) + "vh";
                document.getElementsByClassName("fridge-view-fridge-view")[0].style.height = Math.max(100, (40 * fridgeCounter)) + "vh";
            }
        },
        error: function () {
            console.log('AJAX Error!');
        }
    });
</script>
</body>
</html>