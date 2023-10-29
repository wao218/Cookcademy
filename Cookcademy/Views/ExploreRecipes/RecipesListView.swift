//
//  ContentView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/20/23.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let viewStyle: ViewStyle
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: {
                    RecipeDetailView(recipe: binding(for: recipe))
                })
            }
            .listRowBackground(listBackgroundColor)
            .foregroundStyle(listTextColor)
        }
        .navigationTitle(navigationTitle)
        .listStyle(.plain)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button(action: {
                    isPresenting = true
                    newRecipe = Recipe()
                    newRecipe.mainInformation.category = recipes.first?.mainInformation.category ?? .breakfast
                }, label: {
                    Image(systemName: "plus")
                })
            })
        })
        .sheet(isPresented: $isPresenting, content: {
            NavigationStack {
                ModifyRecipeView(recipe: $newRecipe)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            if newRecipe.isValid {
                                Button("Add") {
                                    if case .favorites = viewStyle {
                                        newRecipe.isFavorite = true
                                    }
                                    recipeData.add(recipe: newRecipe)
                                    isPresenting = false
                                }
                            }
                        }
                    }
                    .navigationTitle("Add a New Recipe")
                
            }
        })
    }
}

extension RecipesListView {
    enum ViewStyle {
        case favorites
        case singleCategory(MainInformation.Category)
    }
    
    private var recipes: [Recipe] {
        switch viewStyle {
        case let .singleCategory(category):
            return recipeData.recipes(for: category)
        case .favorites:
            return recipeData.favoriteRecipes
        }
        
    }
    
    private var navigationTitle: String {
        switch viewStyle {
        case let .singleCategory(category):
            return "\(category.rawValue) Recipes"
        case .favorites:
            return "Favorite Recipes"
        }
    }
    
    func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let index = recipeData.index(of: recipe) else {
            fatalError("Recipe not found")
        }
        return $recipeData.recipes[index]
    }
}

#Preview {
    // NavigationStack is needed to display the navigation title
    NavigationStack {
        RecipesListView(viewStyle: .singleCategory(.breakfast)).environmentObject(RecipeData())
    }
    
}
