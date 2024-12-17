// SPDX-FileCopyrightText: Copyright 2024 Reality Design Lab <dev@reality.design>
// SPDX-FileContributor: Yuchen Zhang <yuchen@reality.design>
// SPDX-License-Identifier: MIT

import SwiftUI


struct ContentView: View {
    @State private var webView = WebView.shared
    @State private var isVisible = false
    
    var body: some View {
        GeometryReader { reader in
            
            ZStack(alignment: .top) {
                VStack() {
                    webView
                        .ignoresSafeArea(webView.viewModel.isFullScreen ? .all : .keyboard)
                        .statusBarHidden(webView.viewModel.isFullScreen)
                    
                    if !webView.viewModel.isFullScreen {
                        HStack {
                            Button(action: {
                                // TODO: Show info
                            }) {
                                Image(systemName: "info.circle")
                            }
                            
                            TextField("Enter address", text: $webView.viewModel.urlString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                webView.load()
                            }) {
                                Image(systemName: "arrow.clockwise")
                            }
                        }
                        .padding([.leading, .trailing])
                        .padding(.top, 8)
                        
                        HStack(spacing: 50) {
                            Button(action: {
                                webView.goBack()
                            }) {
                                Image(systemName: "chevron.left")
                            }
                            .disabled(!webView.viewModel.canGoBack)
                            
                            Button(action: {
                                webView.goForward()
                            }) {
                                Image(systemName: "chevron.right")
                            }
                            .disabled(!webView.viewModel.canGoForward)
                            
                            Button(action: {
                                // TODO: Share action
                            }) {
//                                Image(systemName: "square.and.arrow.up")
                                Image("arrow-box")
                            }
                            
                            Button(action: {
                                webView.goHome()
                            }) {
                                Image("home-arrow")
                            }
                            
                            Button(action: {
                                // TODO: Screen list action
                            }) {
                                Image("four-squares")
                            }
                        }
                        .padding()
                    }
                } /* VStack */
                
                if webView.viewModel.isArMode {
                    ARViewContainer()
                        .ignoresSafeArea()
                    DynamicIsland(
                        size: reader.size,
                        isVisible: $isVisible,
                        isArMode: $webView.viewModel.isArMode)
                }
                
            } /* ZStack */

        } /* reader */
        .ignoresSafeArea()
        .statusBarHidden(webView.viewModel.isArMode || webView.viewModel.isFullScreen)
        
    } /* body */
} /* ContentView */


#Preview {
    ContentView()
}
