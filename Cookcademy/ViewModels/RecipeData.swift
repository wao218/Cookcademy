//
//  RecipeData.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/21/23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
    }
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        
        return nil
    }
    
    private var recipeFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appending(component: "recipeData")
        } catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
    func saveRecipes() {
        do {
            let encodedData = try JSONEncoder().encode(recipes)
            try encodedData.write(to: recipeFileURL)
        } catch {
            fatalError("An error occurred while saving recipes: \(error)")
        }
    }
    
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipeFileURL) else { return }
        do {
            let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = savedRecipes
        } catch {
            fatalError("An error occurred while loading recipes: \(error)")
        }
    }
}
