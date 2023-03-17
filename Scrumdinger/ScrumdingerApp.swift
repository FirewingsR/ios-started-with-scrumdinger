//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by William on 2023/3/17.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
