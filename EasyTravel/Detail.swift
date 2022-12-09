//
//  Detail.swift
//  EasyTravel
//
//  Created by Valentine on 06/12/2022.
//

import SwiftUI

struct Detail: View {
    
    //Constante pour les récupérer les couleurs présentes dans Assets
    private let orange:Color = Color("MyOrange")
    private let blue:Color = Color("MyBlue")
    private let yellow:Color = Color("MyYellow")
    private var pickerEvent = ["Locations", "Vols"]
    @State private var location = "Locations"
    @State private var vol = "Vol"
    
    private var locationList = [
        Location(image: "ImageSydney1", name: "Hotel", location: "centre vill", price: 234, numberBedR: 1, numberBathR: 1)
    ]
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                
                //Affichage des informations sur la destination récupéré sur DetailInformations
                DetailInformation(title: "Sydney, Australie", descriptionIconHealth: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconCost: "Si vous faites vos courses au supermarché, vous pouvez vous en sortir pour 20 AU$ (13 €) par personne et par jour.La taxe sur les biens et les services (goods and services tax, GST) est de 10 %. Elle est incluse dans les prix affichés (c’est la loi). ", descriptionIconSecurity: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconWeather: "Le climat y est subtropical humide, c’est-à-dire que les étés sont chauds et pluvieux, les hivers en général assez courts et frais.", description: "Sydney, installée sur une superbe baie, est la plus ancienne ville d’Australie et un port important. Fondée à la fin du XIXe siècle par les colons européens, elle est aujourd’hui la ville la plus peuplée du pays. Sydney a réussi le pari d’entrer d’un bond dans le XXIe siècle tout en gardant un charme ancien.")
                Spacer()
                
                //Récupération de la liste des locations/hotels
                Picker("Event", selection: $location) {
                    HStack {
//                        Image("ImageSydney1")
//                            .resizable()
//                            .frame(width: 100, height: 100)
                        Text("Hello")
                    }

                }
            }
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail()
    }
}


// Permet d'afficher la liste des locations ou hôtel proposer sur la destination

//faire un picker pour ajouter la liste des locations/hotel et les vols
struct LocationRow {
    
    var location: Location
    
    var body: some View {
        HStack {
            Image(location.image)
            Text(location.name)
        }
    }
}

struct Location: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var location: String
    var price: Double
    var numberBedR: Int
    var numberBathR: Int
}


// faire ajout favoris et ajout déjà visité



/**Link(destination: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
 Label("Share", systemImage: "link.circle.fill")
 }*/
