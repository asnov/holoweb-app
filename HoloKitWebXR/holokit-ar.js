var originalLog = console.log;
console.log = function(message) {
    originalLog(message); // Continue to log to the browser console
    window.webkit.messageHandlers.logHandler.postMessage(String(message));
}

console.log("holokit-ar.js loaded")

if (typeof WebXRPolyfill !== 'undefined' && !navigator.xr) {
    
}