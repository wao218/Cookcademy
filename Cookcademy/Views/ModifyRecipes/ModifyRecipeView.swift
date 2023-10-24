//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/23/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(name: "Test", description: "Test", author: "Test", category: .breakfast)
            recipe.directions = [Direction(description: "test", isOptional: false)]
            recipe.ingredients = [Ingredient(name: "test", quantity: 1.0, unit: .none)]
        }
    }
}

// Need to use this preview stucture to add state variables to the preview
struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
    
}
