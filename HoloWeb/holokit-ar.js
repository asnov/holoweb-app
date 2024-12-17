const originalLog = console.log;
console.log = function(...args) {
    originalLog(args); // Continue to log to the browser console
    for (let arg of args ) {
        window.webkit.messageHandlers.logHandler.postMessage(String(arg));
    }
}

const requestSessionOriginal = navigator.xr.requestSession;
navigator.xr.requestSession = ( mode, sessionInit ) => {
    console.log("requestSession() called with:", mode.toString(), sessionInit.toString());
    window.webkit.messageHandlers.requestSession.postMessage(String(mode));
    let result = requestSessionOriginal(mode, sessionInit)
    console.log("requestSession returned:", result)
    return result
}

console.log("holokit-ar.js loaded")

if (typeof WebXRPolyfill !== 'undefined' && !navigator.xr) {
    const polyfill = new WebXRPolyfill();
}

if (navigator.xr) {
    navigator.xr.isSessionSupported("immersive-ar").then((supported) => {
        if (supported) {
            console.log("immersive-ar mode is supported")
        } else {
            console.log("immersive-ar mode is not supported")
        }
    });
} else {
    console.log("immersive-ar mode is not supported")
}
