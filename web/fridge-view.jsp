<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Title</title>
    <link rel="stylesheet" href="css/core.css" />
    <link href="css/fridge-view.css" rel="stylesheet"/>
</head>
<body>
<div>
    <div class="fridge-view-container">
        <div class="fridge-view-fridge-view">
            <div class="fridge-view-divfridgeadd">
                <span class="fridge-view-text6">+</span>
            </div>
            <div class="fridge-view-divfridge" id="fridge">
                <img
                        src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/47b180bd-2678-455c-90c2-18dd2016a5c9?org_if_sml=11443"
                        alt="imgfridge15"
                        class="fridge-view-imgfridge"
                />
                <span class="fridge-view-text"><span>홍길동의 냉장고</span></span>
                <div class="fridge-view-btnviewmore">
                    <span class="fridge-view-text2"><span>자세히 보기</span></span>
                </div>
                <div class="fridge-view-btndelete">
                    <span class="fridge-view-text4"><span>삭제하기</span></span>
                </div>
            </div>
            <div class="nav-bar-container">
                <div class="nav-bar-nav-bar">
                    <div class="nav-bar-navhome" style="background-color: #00000000;">
                        <img
                                src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/5927e201-d88a-4e43-878d-5b3d6062ecb3?org_if_sml=1548"
                                alt="home29025"
                                class="nav-bar-home2"
                        />
                    </div>
                    <div class="nav-bar-navfridge">
                        <img
                                src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/fba88ca1-98f5-4ab4-a593-3d87d244604c?org_if_sml=1563"
                                alt="fridge39024"
                                class="nav-bar-fridge3"
                        />
                    </div>
                    <div class="nav-bar-navrecipe" style="background-color: #00000000;">
                        <img
                                src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/78ea5ae3-a97c-4084-96d5-b9a57792d3d7?org_if_sml=1704"
                                alt="recipe29025"
                                class="nav-bar-recipe2"
                        />
                    </div>
                    <div class="nav-bar-navaccount" style="background-color: #00000000;">
                        <img
                                src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/6f676c02-2824-4bdf-8760-2a2e8a663d67?org_if_sml=1902"
                                alt="account29025"
                                class="nav-bar-account2"
                        />
                    </div>
                    <div class="nav-bar-navquit" style="background-color: #00000000;">
                        <img
                                src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/c8189b06-60d4-4e4b-8d65-6102d81fc534?org_if_sml=1575"
                                alt="leave29025"
                                class="nav-bar-leave2"
                        />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function addNewFridgeDiv() {
        const fridgeDiv = document.getElementById("fridge");
        const newFridgeDiv = fridgeDiv.cloneNode(true);
        newFridgeDiv.style.top = "38vh";
        fridgeDiv.parentNode.insertBefore(newFridgeDiv, fridgeDiv.nextSibling);
        // fridgeDiv.after(newFridgeDiv);

    }
</script>
</body>
</html>