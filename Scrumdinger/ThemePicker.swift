//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 11/06/24.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        if #available(iOS 16.0, *) {
            Picker("Theme", selection: $selection) {
                ForEach(Theme.allCases) { theme in
                    ThemeView(theme: theme)
                        .tag(theme)
                }
            }
            .pickerStyle(.navigationLink)
        } else {
            Picker("Theme", selection: $selection) {
                ForEach(Theme.allCases) { theme in
                    ThemeView(theme: theme)
                        .tag(theme)
                }
            }
        }
    }
}

#Preview {
    ThemePicker(selection: .constant(.periwinkle))
}
