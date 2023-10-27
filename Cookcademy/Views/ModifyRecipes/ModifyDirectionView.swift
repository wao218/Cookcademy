//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/27/23.
//

import SwiftUI

struct ModifyDirectionView: View {
    @Binding var direction: Direction
    let createAction: (Direction) -> Void
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Direction Description", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction)
                    dismiss()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundStyle(listTextColor)
    }
}

#Preview {
    @State var emptyDirection = Direction(description: "", isOptional: false)
    return ModifyDirectionView(direction: $emptyDirection) { _ in
        return
    }
}
