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
        NavigationView {
            ScrollView{
                let columns = [GridItem(), GridItem()]
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        ZStack {
                            Image(category.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(category.rawValue)
                                .font(.title)
                        }
                        
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
