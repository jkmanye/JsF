<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>JsF</title>
    <%--    <link rel="stylesheet" href="styles/login.css"/>--%>
    <link href="css/fridge-management.css" rel="stylesheet"/>
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
<div class="fridge-management-container">
    <div class="fridge-management-fridge-management">
        <div class="fridge-management-divfridgemanage">
            <div class="fridge-management-container1">
                <img
                        src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/3690f582-dc18-48d1-a09c-fd2d7ba89796?org_if_sml=11443"
                        alt="imgfridge1803"
                        class="ingredients-view-imgfridge"
                />
                <span class="fridge-management-text" id="fridgeName"><span>문종건의 냉장고</span></span>
                <a class="fridge-management-btnviewmore" style="color: #FFFFFF; right: 30vw; top: 80vh;" href='javascript:window.location.href = "/fridgeView";'>돌아가기</a>
                <a class="fridge-view-btndelete" style="color: #FFFFFF; right: 0px; top: 80vh;" href="javascript:deleteFridge();">삭제하기</a>
                <div class="fridge-management-properties">
                    <span class="fridge-management-text06">냉장고 코드</span>
                    <span class="fridge-management-text08">공유된 사용자</span>
                    <span class="fridge-management-text10">재료 목록</span>
                    <span class="fridge-management-text12">최근 사용 날짜</span>
                    <span class="fridge-management-text14" id="code"></span>
                    <span class="fridge-management-text16" id="user"></span>
                    <span class="fridge-management-text18" id="ingredients">없음</span>
                    <span class="fridge-management-text20" id="lastDate"></span>
<%--                    <a class="fridge-management-btncopy fridge-management-text24">복사하기</a>--%>
<%--                    <a class="fridge-management-btnviewmore fridge-management-text24">더보기</a>--%>
                    <a class="fridge-management-btnviewmore" style="color: #FFFFFF; top: 4vh; left: 6vw;" href="javascript:copy();">복사하기</a>
                    <a class="fridge-management-btnviewmore" style="color: #FFFFFF; top: 28vh; left: 6vw;" href="javascript:ingredientsView();">더보기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    let fridgeCode;

    function copy() {
        window.navigator.clipboard.writeText(fridgeCode).then(() => {
            alert("복사되었습니다.");
        });
    }

    function ingredientsView() {
        window.location.href = "/ingredientsView?fridgeCode=" + fridgeCode + "&fridgeName=" + document.getElementById("fridgeName").innerText;
    }

    window.onload = function () {
        document.getElementsByClassName('fridge-management-fridge-management')[0].append(new DOMParser().parseFromString('<div class="loader-container" id="loading" style="height: 100vh;"><div class="spinner"></div></div>', 'text/html').body.firstChild);

        fridgeCode = new URL(window.location).searchParams.get("fridgeCode");
        // const code = document.getElementById("code").innerText = window.location.parameters.get("fridgeCode");
        $.ajax({
            url: "/api/fridge",
            dataType: "json",
            processData: false,
            method: "POST",
            data: JSON.stringify({
                action: "get",
                fridgeCode: fridgeCode
            }),
            success: function (json) {
                console.log(JSON.stringify(json));
                document.getElementById("code").innerText = json.code;
                document.getElementById("lastDate").innerText = json.lastUsed.replaceAll('-', '/');
                document.getElementById("fridgeName").innerText = json.name;
                document.getElementById("loading").remove();
            },
            error: function () {
                console.log("AJAX error!");
                alert('쿼리 오류가 발생하였습니다. 앱을 종료 후 다시 시도해주세요.');
            }
        });

        $.ajax({
            url: "/api/ingredients",
            method: "POST",
            dataType: "json",
            processData: false,
            data: JSON.stringify({
                action: "get",
                fridgeCode: new URL(window.location).searchParams.get("fridgeCode")
            }),
            success: function (json) {
                document.getElementById("ingredients").innerText = json[0].type + " 외 " + (json.length - 1) + "개";
            },
            error: function () {
                console.log("AJAX error!");
                alert('쿼리 오류가 발생하였습니다. 앱을 종료 후 다시 시도해주세요.');
            }
        });

        $.ajax({
            url: "/api/fridge",
            method: "POST",
            dataType: "json",
            processData: false,
            data: JSON.stringify({
                action: "count",
                fridgeCode: new URL(window.location).searchParams.get("fridgeCode")
            }),
            success: function (json) {
                document.getElementById("user").innerText = (json.length ) + "명";
            },
            error: function () {
                console.log("AJAX error!");
                alert('쿼리 오류가 발생하였습니다. 앱을 종료 후 다시 시도해주세요.');
            }
        });
    };

    function deleteFridge() {
        if (confirm("이 냉장고를 정말 삭제하시겠습니까?")) {
            $.ajax({
                url: "/api/user",
                dataType: "json",
                processData: false,
                method: "POST",
                data: JSON.stringify({
                    action: "removeFridge",
                    email: window.sessionStorage.accountEmail,
                    fridgeCode: fridgeCode
                }),
                success: function (json) {
                    $.ajax({ 
                        url: "/api/fridge",
                        dataType: "json",
                        processData: false,
                        method: "POST",
                        data: JSON.stringify({
                            action: "delete",
                            fridgeCode: fridgeCode
                        }),
                        success: function (json) {
                            console.log(JSON.stringify(json));
                            window.location.href = "/fridgeView";
                        },
                        error: function () {
                            console.log("AJAX error!");
                            alert('쿼리 오류가 발생하였습니다. 앱을 종료 후 다시 시도해주세요.');
                        }
                    });
                },
                error: function () {
                    console.log("AJAX error!");
                    alert('쿼리 오류가 발생하였습니다. 앱을 종료 후 다시 시도해주세요.');
                }
            });
        }
    }
</script>
</body>
</html>
