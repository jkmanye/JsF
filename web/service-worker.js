const OFFLINE_VERSION = 1;
const CACHE_NAME = "jsf_offline";
const OFFLINE_URL = "offline.html";

self.addEventListener("install", (event) => {
    event.waitUntil(
        (async () => {
            const cache = await caches.open(CACHE_NAME);
            await cache.add(new Request(OFFLINE_URL, { cache: "reload" }));
        })()
    );

    self.skipWaiting();
});

self.addEventListener("activate", (event) => {
    event.waitUntil(
        (async () => {
            if ("navigationPreload" in self.registration) {
                await self.registration.navigationPreload.enable();
            }
        })()
    );

    self.clients.claim();
});

self.addEventListener("fetch", (event) => {
    if (event.request.mode === "navigate") {
        event.respondWith(
            (async () => {
                try {
                    const preloadResponse = await event.preloadResponse;
                    if (preloadResponse) {
                        return preloadResponse;
                    }

                    const networkResponse = await fetch(event.request);
                    return networkResponse;
                } catch (error) {
                    console.log("Fetch failed; returning offline page instead.", error);

                    const cache = await caches.open(CACHE_NAME);
                    const cachedResponse = await cache.match(OFFLINE_URL);
                    return cachedResponse;
                }
            })()
        );
    }
});

self.addEventListener('notificationclick', event => {
    if(event.action === 'confirm') {
        event.waitUntil(clients.matchAll({
            type: "window",
            includeUncontrolled: true
        }).then(function (clientList) {
            let client = null;

            for (let i = 0; i < clientList.length; i++) {
                let item = clientList[i];

                if (item.url) {
                    client = item;
                    break;
                }
            }

            if (client && 'navigate' in client) {
                client.focus();
                event.notification.close();
                return client.navigate("https://jsf-github-84edab6d943b.herokuapp.com/fridgeView");
            }
            else {
                event.notification.close();
                return clients.openWindow("https://jsf-github-84edab6d943b.herokuapp.com/fridgeView");
            }
        }));
    }
    event.notification.close();
});

function displayNotif(message) {
    const options = {
        title: '지식냉장고',
        body : message,
        icon : `../pwaManifest/icon-192x192.png`,
        image : `../pwaManifest/icon-192x192.png`,
        dir : 'ltr',
        lang : 'ko-KR',
        vibrate : [50, 50, 50, 50, 50, 50, 50],
        badge : `../pwaManifest/icon-192x192.png`,
        renotify : false,
        actions : [
            { action : 'confirm', title : '확인하기', icon : '/img/icons/android-icon-48x48.png' },
        ]
    };

    self.registration.showNotification(title, options);
}
