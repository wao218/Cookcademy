//
//  SettingsView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/29/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var hideOptionalSteps: Bool = false
    @State private var listBackgroundColor = AppColor.background
    @State private var listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationStack {
            Form {
                ColorPicker("List BackgroundColor", selection: $listBackgroundColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                ColorPicker("Text Color", selection: $listTextColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                Toggle("Hide Optional Steps", isOn: $hideOptionalSteps)
                    .padding()
                    .listRowBackground(listBackgroundColor)
            }
            .foregroundStyle(listTextColor)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
