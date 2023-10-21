//
//  ContentView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/20/23.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle(navigationTitle)
        .listStyle(.plain)
    }
}

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView()
    }
    
}
