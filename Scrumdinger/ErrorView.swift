//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 30/08/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    Text("An error has occurred!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.bottom)
                    
                    Text(errorWrapper.error.localizedDescription)
                        .font(.headline)
                    
                    Text(errorWrapper.guidance)
                        .font(.caption)
                        .padding(.top)
                    
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Dismiss") {
                            dismiss()
                        }
                    }
                }
            }
        } else {
            NavigationView {
                VStack {
                    Text("An error has occurred!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.bottom)
                    
                    Text(errorWrapper.error.localizedDescription)
                        .font(.headline)
                    
                    Text(errorWrapper.guidance)
                        .font(.caption)
                        .padding(.top)
                    
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Dismiss") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}


enum SampleError: Error {
    case errorRequired
}

#Preview {
    ErrorView(errorWrapper: ErrorWrapper(error: SampleError.errorRequired,
                                         guidance: "You can safely ignore this error."))
}
