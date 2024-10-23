//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import SwiftUI

struct RecipeDetailView: View {
    let url: URL
    
    var body: some View {
        /*ScrollView {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle("Recipe Details")*/
        
        SafariWebView(url: url)
            .ignoresSafeArea()
    }
}


#Preview {
    RecipeDetailView(url: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")!)
}
