<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>SusF</title>
    <link href="css/ingredients-view.css" rel="stylesheet"/>
</head>
<body>
<div>
    <div class="ingredients-view-container">
        <div class="ingredients-view-ingredients-view">
            <div class="ingredients-view-divfridgemanage">
                <img
                        src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/1a08c9b0-7874-4c06-8f53-2871e3826731/3690f582-dc18-48d1-a09c-fd2d7ba89796?org_if_sml=11443"
                        alt="imgfridge1803"
                        class="ingredients-view-imgfridge"
                />
                <span class="ingredients-view-text"><span>재료<br><br>당근<br>양파<br>두부</span></span>
                <span class="ingredients-view-text02"><span>소비기한<br><br>2023-06-25<br>2023-06-28<br>2023-07-01</span></span>
                <span class="ingredients-view-text04"><span>선택<br><br>ㅁ<br>ㅁ<br>ㅁ</span></span>
                <span class="ingredients-view-text06"><span>홍길동의 냉장고</span></span>
                <div class="ingredients-view-frame2">
                    <span class="ingredients-view-text08"><span>돌아가기</span></span>
                </div>
                <div class="ingredients-view-frame3">
                    <span class="ingredients-view-text10"><span>삭제하기</span></span>
                </div>
                <div class="ingredients-view-frame4">
                  <span class="ingredients-view-text12">
                    <span>재료 추가하기</span>
                  </span>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function addNewIngredientDiv() {
        const ingredientDiv = document.getElementById("ingredientDiv");
        const newIngredientDiv = ingredientDiv.cloneNode(true);
        newIngredientDiv.style.top = "70vh";
        ingredientDiv.parentNode.insertBefore(newIngredientDiv, ingredientDiv.nextSibling);
        // fridgeDiv.after(newFridgeDiv);
    }
</script>
</body>
</html>