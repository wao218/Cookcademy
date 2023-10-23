//
//  ContentView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/20/23.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: {
                    RecipeDetailView(recipe: recipe)
                })
            }
            .listRowBackground(listBackgroundColor)
            .foregroundStyle(listTextColor)
        }
        .navigationTitle(navigationTitle)
        .listStyle(.plain)
    }
}

extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

#Preview {
    // NavigationStack is needed to display the navigation title
    NavigationStack {
        RecipesListView(category: .breakfast).environmentObject(RecipeData())
    }
    
}
