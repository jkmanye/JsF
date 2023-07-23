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
    <title>JsF</title>
    <meta charset="UTF-8"/>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"/>
    <link rel="stylesheet" href="css/core.css">
    <link rel="manifest" href="${pageContext.request.contextPath}/pwaManifest/manifest.webmanifest">
    <link rel="apple-touch-icon" href="pwaManifest/icon-512x512.png">
    <link rel="shortcut icon" type="image/jpg" href="pwaManifest/icon-512x512.png">
    <link rel="icon" href="favicon.ico">
</head>
<body style="background-color: #222222;">

<button id="installBtn" class="button_confirm" style="left: 25vw; top: calc(50vh - 15px); width: 50vw;">지식냉장고 앱 설치하기</button>

<script type="text/javascript">
    let deferredPrompt;

    window.addEventListener('beforeinstallprompt', (e) => {
        // Prevent the mini-infobar from appearing on mobile
        e.preventDefault();
        // Stash the event so it can be triggered later.
        deferredPrompt = e;
        // Update UI notify the user they can install the PWA
        // showInstallPromotion();
        // Optionally, send analytics event that "PWA install" promo was shown.
        console.log(`'beforeinstallprompt' event was fired.`);
    });

    document.getElementById("installBtn").addEventListener('click', async () => {
        // Hide the app provided install promotion
        // hideInstallPromotion();
        // Show the install prompt
        deferredPrompt.prompt();
        // Wait for the user to respond to the prompt
        const { outcome } = await deferredPrompt.userChoice;
        // Optionally, send analytics event with outcome of user choice
        console.log(`User response to the install prompt: ${outcome}`);
        // We've used the prompt, and can't use it again, throw it away
        deferredPrompt = null;
        //
    });
</script>
</body>
</html>
