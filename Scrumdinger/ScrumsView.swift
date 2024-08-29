//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 25/05/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                ScrumListView(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        } else {
            NavigationView {
                ScrumListView(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
