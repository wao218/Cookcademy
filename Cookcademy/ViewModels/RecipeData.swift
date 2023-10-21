//
//  RecipeData.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/21/23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
