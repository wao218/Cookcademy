//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/21/23.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @State private var isPresenting = false
    
    @EnvironmentObject private var recipeData: RecipeData
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(content: {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                            .foregroundStyle(listTextColor)
                    }
                }, header: {
                    Text("Ingredients")
                }).listRowBackground(listBackgroundColor)
                Section(content: {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        if direction.isOptional && hideOptionalSteps {
                            EmptyView()
                        } else {
                            HStack {
                                let index = recipe.index(of: direction, excludingOptionalDirections: hideOptionalSteps) ?? 0
                                Text("\(index + 1). ").bold()
                                Text("\(direction.isOptional ? "(Optional) ": "")" + "\(direction.description)")
                            }.foregroundStyle(listTextColor)
                        }
                    }
                }, header: {
                    Text("Directions")
                }).listRowBackground(listBackgroundColor)
            }
            
        }
        .navigationTitle(recipe.mainInformation.name)
        .toolbar {
            ToolbarItem {
                HStack {
                    Button("Edit") {
                        isPresenting = true
                    }
                    Button {
                        recipe.isFavorite.toggle()
                    } label: {
                        Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                    }

                }
            }
        }
        .sheet(isPresented: $isPresenting) {
            NavigationStack {
                ModifyRecipeView(recipe: $recipe)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                isPresenting = false
                            }
                        }
                    }
                    .navigationTitle("Edit Recipe")
            }.onDisappear {
                recipeData.saveRecipes()
            }
        }
    }
}

#Preview {
    // NavigationStack is needed to display the navigation title
    @State var recipe = Recipe.testRecipes[0]
    return NavigationStack {
        RecipeDetailView(recipe: $recipe)
    }
    
}
