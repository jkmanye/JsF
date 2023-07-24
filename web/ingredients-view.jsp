<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <link href="css/ingredients-view.css" rel="stylesheet"/>
    <link href="css/core.css" rel="stylesheet"/>
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<div>
    <div class="ingredients-view-container">
        <div class="ingredients-view-ingredients-view">
            <div class="ingredients-view-divfridgemanage" id="mainDiv">
                <img
                        src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/3690f582-dc18-48d1-a09c-fd2d7ba89796?org_if_sml=11443"
                        alt="imgfridge1803"
                        class="ingredients-view-imgfridge"
                />
                <span class="ingredients-view-text" id="names">재료<br><br></span>
                <span class="ingredients-view-text02" id="expire">소비기한<br><br></span>
                <span class="ingredients-view-text04" id="select">선택</span>
                <span class="ingredients-view-text06" id="fridgeName"></span>
                <a href='javascript:returnOrRecipe();' class="ingredients-view-frame2">
                    <span class="ingredients-view-text08" id="changing">돌아가기</span>
                </a>
                <a href='javascript:deleteIngredient();' class="ingredients-view-frame3">
                    <span class="ingredients-view-text10">재료 삭제하기</span>
                </a>
                <a href='javascript:window.location.href = "/ingredientsAdd" + window.location.search;' class="ingredients-view-frame4">
                  <span class="ingredients-view-text12">재료 추가하기</span>
                </a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    let json = [];

    window.onload = function () {
        document.getElementById("fridgeName").innerText = new URL(window.location).searchParams.get("fridgeName");
        document.getElementsByClassName('ingredients-view-ingredients-view')[0].append(new DOMParser().parseFromString('<div class="loader-container" id="loading" style="height: 100vh;"><div class="spinner"></div></div>', 'text/html').body.firstChild);

        $.ajax({
            url: "/api/ingredients",
            method: "POST",
            dataType: "json",
            processData: false,
            data: JSON.stringify({
                action: "get",
                fridgeCode: new URL(window.location).searchParams.get("fridgeCode")
            }),
            success: function (tempJson) {
                console.log(JSON.stringify(tempJson));
                let finalSelect = "";
                let finalExpire = "";

                let length = tempJson.length;

                for(var index in tempJson) {
                    let miniJson = tempJson[index]
                    console.log(miniJson);
                    json.push(miniJson);

                    const yyyyMMdd = miniJson.expireDate;
                    const sYear = yyyyMMdd.substring(0,4);
                    const sMonth = yyyyMMdd.substring(5,7);
                    const sDate = yyyyMMdd.substring(8,10);
                    // document.getElementById("select").innerHTML += "☐<br>";

                    finalSelect += miniJson.type + "<br>";
                    finalExpire += (Math.ceil((new Date(Number(sYear), Number(sMonth)-1, Number(sDate)).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24))) + "일 남음<br>";
                    const checkBox = document.createElement("input");
                    checkBox.type = "checkbox";
                    checkBox.style.width = "20px";
                    checkBox.style.height = "20px";
                    checkBox.style.right = "7vw";
                    checkBox.style.top = "calc(" + (((index + 3) * 23 - 2) + "px") + " + 30vh)";
                    checkBox.id = "checkBox" + index;
                    checkBox.style.position = "absolute";
                    checkBox.setAttribute("onclick", "changeButtonText()");
                    document.getElementById("mainDiv").appendChild(checkBox);
                }

                document.getElementById("names").innerHTML += finalSelect;
                document.getElementById("expire").innerHTML += finalExpire;

                document.getElementById("loading").remove();

                // for (let i = 0; i < length; i++) {
                //     const checkBox = document.createElement("input");
                //     checkBox.type = "checkbox";
                //     checkBox.style.width = "20px";
                //     checkBox.style.height = "20px";
                //     checkBox.style.right = "7vw";
                //     checkBox.style.top = "calc(" + ((i - 2) * 23 + "px") + " + 40vh)";
                //     checkBox.id = "checkBox" + i;
                //     checkBox.style.position = "absolute";
                //     checkBox.setAttribute("onclick", "changeButtonText()");
                //     document.getElementById("mainDiv").appendChild(checkBox);
                // }
            },
            error: function () {
                console.log("AJAX error!");
            }
        });

        // for (const checkBox of document.getElementsByTagName("input")) {
        //     if (Object.is(checkBox.type, "checkbox")) {
        //
        //     }
        // }

        // while (true) changeButtonText();
    };

    function checks() {
        let result = [];
        for (let i = 0; i < json.length; i++) {
            if (document.getElementById("checkBox" + i).checked) result.push(i)
        }
        return result;
    }

    function recipe() {
        let queryString = "";
        for (let i of checks()) {
            queryString += (json[i].type + " ");
        }
        window.location.href = "/recipe?queryString=" + queryString;
    }

    function returnOrRecipe() {
        if (Object.is(0, checks().length)) window.location.href = "/fridgeManagement" + window.location.search;
        else recipe();
    }

    function changeButtonText() {
        if (Object.is(0, checks().length)) document.getElementById("changing").innerText = "돌아가기"
        else document.getElementById("changing").innerText = "레시피 찾기";
    }

    function deleteIngredient() {
        for (let i in checks()) {
            let miniJson = json[i];
            $.ajax({
                url: "/api/ingredients",
                dataType: "json",
                processData: false,
                method: "POST",
                data: JSON.stringify({
                    action: "delete",
                    fridgeCode: new URL(window.location).searchParams.get("fridgeCode"),
                    type: miniJson.type
                }),
                success: function (json) {
                    window.location.reload();
                },
                error: function () {
                    console.log("AJAX error!");
                }
            })
        }
    }
</script>
</body>
</html>