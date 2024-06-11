//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 22/05/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
