<%--
  Created by IntelliJ IDEA.
  User: jkmanye
  Date: 2023/06/25
  Time: 10:15 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<html>
<head>
    <title>MtF</title>
    <meta charset="UTF-8"/>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"/>
    <link rel="stylesheet" href="styles/core.css">
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body style="background-color: #fcfcfc;">

<button id="installBtn" disabled>Install</button>

<script type="text/javascript">
    var beforeInstallPrompt = null;

    window.addEventListener("beforeinstallprompt", eventHandler, errorHandler);

    function eventHandler(event) {
        beforeInstallPrompt = event;
        document.getElementById("installBtn").removeAttribute("disabled");
    }

    function errorHandler(event) {
        console.log("error: " + event);
    }

    function install() {
        if (beforeInstallPrompt) beforeInstallPrompt.prompt();
    }
</script>
</body>
</html>
