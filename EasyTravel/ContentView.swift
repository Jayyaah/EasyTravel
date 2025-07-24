//
//  ContentView.swift
//  Voyage
//
//  Created by Pascal Cusset on 01/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var changeView = 0
    var body: some View {
        VStack {
            if changeView == 0 {
                ProjetVoyageAppMobile(firstVue: $changeView)
            } else {
                TabView {
                    Suggestions(returnToQuizz: $changeView)
                        .tabItem {
                            Label("Suggestions", systemImage: "tray.and.arrow.down.fill")}
                    Favoris()
                        .tabItem {
                            Label("Favoris", systemImage: "heart.fill")}
                    MesVoyagesVisites()
                        .tabItem {
                            Label("Mes voyages", systemImage: "airplane") }
                }.accentColor(.orange) // Fin TabView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
