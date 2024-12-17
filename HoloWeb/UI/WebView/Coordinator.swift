//
//  Coordinator.swift
//  HoloWeb
//
//  Created by Alex on 08/12/2024.
//

import WebKit

extension WebView {
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
            parent.viewModel.urlString = webView.url?.absoluteString ?? ""
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.viewModel.canGoBack = webView.canGoBack
            parent.viewModel.canGoForward = webView.canGoForward
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard let logMessage = message.body as? String else { return }

            switch message.name {
            case "logHandler":
                print(logMessage)
            case "requestSession":
                // TODO: start AR session
                print("starting AR session")
//                ARManager.shared.StartARSession()   // FIXME: do we need it here?
                self.parent.viewModel.isArMode = true
            default:
                print("message.name: \(message.name)")
                print("message.body: \(message.body)")
            }

        }

    }
    
}
