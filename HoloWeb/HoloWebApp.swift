// SPDX-FileCopyrightText: Copyright 2024 Reality Design Lab <dev@reality.design>
// SPDX-FileContributor: Yuchen Zhang <yuchen@reality.design>
// SPDX-License-Identifier: MIT

import SwiftUI

@main
struct HoloWebApp: App {
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                    guard let incomingURL = userActivity.webpageURL,
                          let components = URLComponents(url: incomingURL, resolvingAgainstBaseURL: true)
                    else { return }
                    print("App incomingURL: \(incomingURL)")
                    print("App components: \(components)")
                    
                }
            
        }
    }
}
