//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 25/08/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                DetailEditView(scrum: $newScrum)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                            }
                        }
                    }
            }
        } else {
            NavigationView {
                DetailEditView(scrum: $newScrum)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
}
