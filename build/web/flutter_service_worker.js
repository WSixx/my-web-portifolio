'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "a04632c109baf66ff525f21b8fa4f2a1",
"assets/assets/audio/starwars.mp3": "92ed57e2f6635e6a87534c86bc57cdf6",
"assets/assets/images/conews/doublePrint2.png": "4ff47824a381d00a06d4b16d7fbc1db8",
"assets/assets/images/conews/print1.png": "d6c39fbc2eab99271c9d2a277bbe232f",
"assets/assets/images/conews/print2.png": "1732d57e07f9441adb5ed592c309d985",
"assets/assets/images/conews/print3.png": "5183ffcbec2bc97624abed18ebe3863f",
"assets/assets/images/despesas/doublePrint3.png": "cd4dc2063be5c74d28db1725515c68d9",
"assets/assets/images/despesas/print1.png": "483d3b059edd94a5ce5206a6852f5413",
"assets/assets/images/despesas/print2.png": "9e7829ebc4bd9efb497b2d263fce52aa",
"assets/assets/images/despesas/print3.png": "259c38c537b5f0639522ca76d29927f2",
"assets/assets/images/meals/doublePrint.png": "48a3d79f0ad2c36f5fb737b9c183303b",
"assets/assets/images/meals/doublePrint2.png": "f29d98a311c5b3e61aa9f5b8d4de1cc7",
"assets/assets/images/meals/print1.png": "4d6044ad7b1119b68a87b1db29aab99b",
"assets/assets/images/meals/print3.png": "f02d4da8c31df29322a73fe199371da0",
"assets/assets/images/meals/print4.png": "5fdc32c375c2f2d1ab5f74a7b10b0b85",
"assets/assets/images/meals/print5.png": "3867b1107b25331941099c79e082e4c2",
"assets/assets/images/moto.jpg": "d436bbafe8b591a946648803cc3e727a",
"assets/assets/images/square.jpg": "1f706568c21af99f37465cc73f409825",
"assets/assets%255Cfonts%255CBebasNeue-Regular.ttf": "21bb70b62317f276f2e97a919ff5bd8c",
"assets/assets%255Cfonts%255CSavings%2520Bond%2520Shadow%2520Regular.ttf": "2888589ccb4e2ffcce58b24bcb126e0e",
"assets/assets%255Cfonts%255Cstjedise.ttf": "a43e30ecbe0c29409e920eebc645e746",
"assets/FontManifest.json": "653f812066dc8268e51aeb33b5ca85e0",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "938316566fd80bdfbda4ef25b54a5603",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00bb2b684be61e89d1bc7d75dee30b58",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4b6a9b7c20913279a3ad3dd9c96e155b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dffd9504fcb1894620fa41c700172994",
"favicon.ico": "2d7ef861bd0c5f966b540e749ca04310",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "bb033a5deeb9003bcf21daf737f842e5",
"/": "bb033a5deeb9003bcf21daf737f842e5",
"main.dart.js": "d28da9dcf933755cfbcdfac7c1fd8665",
"manifest.json": "c6698c4f76c51d31979dd39c76ca62c2",
"version.json": "3787bbda0523995cf94b6bc53d1df0f9"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
