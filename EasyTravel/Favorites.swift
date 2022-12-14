//
//  Ex1.swift
//  Voyage
//
//  Created by Pascal Cusset on 01/12/2022.
//

import SwiftUI

struct Voyage: Identifiable {
    var id = UUID()
    var titreVoyage: String
    var prix: Double
    var photoFavori: String
    var securLabel:Color // vert, orange ou rouge
    var climatLabel:Color
    var prixLabel:Color
    var santeLabel:Color
    var descriptionCourte: String
    var favori = false
}

struct Favorites: View {
    @State var voyages = [
        Voyage(titreVoyage: "Sydney", prix: 1500, photoFavori: "BloiR4", securLabel: .green, climatLabel: .green, prixLabel: .red, santeLabel: .orange, descriptionCourte: "Le poumon économique de l'Australie, située à l'est, dans l'état du New South Wales...", favori: true),
        Voyage(titreVoyage: "Salvador", prix: 900, photoFavori: "Salvador", securLabel: .red, climatLabel: .green, prixLabel: .green, santeLabel: .orange, descriptionCourte: "La perle de la région touristique de Bahia, au nord-est du Brésil. Souvent ensoleillée...", favori: true),
        Voyage(titreVoyage: "Marrakech", prix: 300, photoFavori: "Marra", securLabel: .orange, climatLabel: .green, prixLabel: .green, santeLabel: .red, descriptionCourte: "La perle de l'Atlas, destination la plus célèbre du Maroc...", favori: true),
    ]
    

    var body: some View {
//        var couleurLabel: String
       
        
        
        // structure VoyageRow:View { var voyage:Voyage }
        
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                ForEach(Array(zip(voyages.indices, $voyages)), id: \.0) { index, toto in
                    VoyageFiche(voyage: toto, myFavorites: $voyages, index: index)
     
                    // .navigationDestination(for: Voyage.self) { voyage in
                    //VoyageDetailsValentine (voyage: Voyage)
                    

                    
                    //  VStack générale -  structure séparée (ExtractedView)
                    
                }
                .navigationTitle("Favoris")
            }
            .padding(.horizontal, 30)
        } // Fin NavigationStack
        
    }
}


struct Ex1_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}

struct VoyageFiche: View {
    @Binding var voyage: Voyage
    @Binding var myFavorites: [Voyage]
    var index: Int
    @State var favori:Bool = false
    
    var body: some View {
       
        VStack {
            
            // Début VStack générale
            
            HStack {
                // Début HStack1
                
                Text(voyage.titreVoyage)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("MyOrange"))
                Spacer()
                Text("Prix à partir de \(voyage.prix, specifier: "%.0f")€").bold()
                    
            } // Fin HStack1
            
            
            Image(voyage.photoFavori)
                .resizable()
                .frame(width: 350, height: 200)
                .border(Color.gray, width: 2)
            Spacer()
                .frame(height:20)
            
            HStack {
                // Début HStack2
                
                VStack {
                    // Début VStack2
                    Image(systemName: "circle.fill")
                        .foregroundColor(voyage.securLabel)
                    Text("Sécurité").font(.footnote)
                } // Fin VStack2
                
                VStack {
                    // Début VStack3
                    Image(systemName: "circle.fill")
                        .foregroundColor(voyage.climatLabel)
                    Text("Climat").font(.footnote)
                } // Fin VStack3
                
                VStack {
                    // Début VStack4
                    Image(systemName: "circle.fill")
                        .foregroundColor(voyage.prixLabel)
                    Text("Prix").font(.footnote)
                } // Fin VStack4
                
                VStack {
                    // Début VStack5
                    Image(systemName: "circle.fill")
                        .foregroundColor(voyage.santeLabel)
                    Text("Santé").font(.footnote)
                    
                } // Fin VStack5
                
                Spacer()
                
                // Supprime le voyage de la liste
         
             //   self.favori.toggle()
           
                //if favori {
               // .remove du tableau voyages selon index -> voyages.remove(at: id)
                
                Button {
                    voyage.favori.toggle()
                    if voyage.favori == false {
                        myFavorites.remove(at: index)
                    }
                    
                } label: {
                Text("")
             Image(systemName: "heart.slash.circle")
                .font(.title)
                      .foregroundColor(Color.red)
                }
            }
            // Fin HStack2
            
            Spacer()
            Text(voyage.descriptionCourte)
            Spacer()
                .frame(height:40)
        
            
        }
    }
}
