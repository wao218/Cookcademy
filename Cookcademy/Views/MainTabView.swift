//
//  MainTabView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem {
                    Label("Recipes", systemImage: "list.dash")
                }
            NavigationStack {
                RecipesListView(viewStyle: .favorites)
            }
            .tabItem { Label("Favorites", systemImage: "heart.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

#Preview {
    MainTabView()
}
