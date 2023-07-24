<%--
  Created by IntelliJ IDEA.
  User: jkmanye
  Date: 2023/06/18
  Time: 9:22 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<html>
<head>
    <title>JsF</title>
    <meta charset="UTF-8"/>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"/>
    <link rel="stylesheet" href="styles/core.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body style="background-color: #fcfcfc;">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>

    <script src="scripts/core.js" type="text/javascript"></script>

    <script type="text/javascript">
        window.onload = function () {
            setCookie("logout", true, 2147483647);

            if ("serviceWorker" in navigator) {
                navigator.serviceWorker.register("./service-worker.js");
            }

            if (!window.matchMedia('(display-mode: browser)').matches) {
                window.location.href = "https://" + window.location.host + "/login";
            } else window.location.href = "https://" + window.location.host + "/installation";
        };
    </script>

</body>
</html>
