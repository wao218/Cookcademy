//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/23/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    @State private var selection = Selection.main
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                ModifyComponentsView(ingredients: $recipe.ingredients)
            case .directions:
                Text("Directions Editor")
            }
            Spacer()
        }
        
    }
    
    enum Selection {
        case main
        case ingredients
        case directions
    }
}

#Preview {
    @State var recipe = Recipe()
    return ModifyRecipeView(recipe: $recipe)
}
