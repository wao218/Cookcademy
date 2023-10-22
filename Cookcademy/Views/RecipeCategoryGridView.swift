//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by wesley osborne on 10/21/23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        CategoryView(category: category)
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
