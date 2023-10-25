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
                Text("Main Editor")
            case .ingredients:
                Text("Ingredients Editor")
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

// Need to use this preview stucture to add state variables to the preview
struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
    
}
