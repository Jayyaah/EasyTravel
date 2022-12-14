//
//  ContentView.swift
//  EasyTravel
//
//  Created by Valentine on 06/12/2022.
//

import SwiftUI

struct ContentView: View {
    private let orange:Color = Color("MyOrange")
    
    var body: some View {
        
            TabView {
                Suggestions()
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("Quizz")
                    }
                Favorites()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favoris")
                    }.accentColor(orange)
                Text("")
                    .tabItem {
                        Image(systemName: "airplane")
                        Text("Mes Voyages")
                    }
            }.accentColor(orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
