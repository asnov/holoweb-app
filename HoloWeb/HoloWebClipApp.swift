//
//  HoloWebClipApp.swift
//  HoloWebClip
//
//  Created by Botao Hu on 11/17/24.
//

import SwiftUI

@main
struct HoloWebClipApp: App {
    var body: some Scene {
        WindowGroup {

            ContentView()
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                    guard let incomingURL = userActivity.webpageURL,
                          let components = URLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
                          let quieryItems = components.queryItems
                    else { return }
                    print("ClipApp incomingURL: \(incomingURL)")
                    print("ClipApp components: \(components)")

                    if let urlToOpen = quieryItems.first(where: {$0.name == "url"}) {
                        print("ClipApp urlToOpen: '\(urlToOpen.value ?? "")'")
                    } else {
                        print("ClipApp urlToOpen: nill")
                    }
                }

        }
    }
}
