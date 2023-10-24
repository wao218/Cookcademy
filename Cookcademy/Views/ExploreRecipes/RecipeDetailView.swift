//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/21/23.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
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
                        HStack {
                            Text("\(index + 1). ").bold()
                            Text("\(direction.isOptional ? "(Optional) ": "")" + "\(direction.description)")
                        }.foregroundStyle(listTextColor)
                    }
                }, header: {
                    Text("Directions")
                }).listRowBackground(listBackgroundColor)
            }
            
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

#Preview {
    // NavigationStack is needed to display the navigation title
    NavigationStack {
        RecipeDetailView(recipe: Recipe.testRecipes[0])
    }
    
}
