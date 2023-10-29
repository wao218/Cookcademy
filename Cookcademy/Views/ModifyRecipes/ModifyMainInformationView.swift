//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/25/23.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            } header: {
                Text("Description")
            }
            Picker(selection: $mainInformation.category) {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue) 
                }
            } label: {
                HStack {
                    Text("Category")
                    Spacer()
                }
            }
            .listRowBackground(listBackgroundColor)

        }.foregroundStyle(listTextColor)
    }
}

#Preview("Filled In Info") {
    @State var mainInformation =  MainInformation(name: "Test Name", description: "Test Description", author: "Test Author", category: .breakfast)
    return ModifyMainInformationView(mainInformation: $mainInformation)
}

#Preview("Empty State") {
    @State var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
    return ModifyMainInformationView(mainInformation: $emptyInformation)
}
