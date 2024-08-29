//
//  ScrumListView.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 29/08/24.
//

import SwiftUI

struct ScrumListView: View {
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool

    var body: some View {
        List($scrums) { $scrum in
            NavigationLink(destination: DetailView(scrum: $scrum)) {
                CardView(scrum: scrum)
            }
            .listRowBackground(scrum.theme.mainColor)
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus.circle")
            }
        }
        .accessibilityLabel("New Scrum")
    }
}

#Preview {
    ScrumListView(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(false))
}
