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
    @State private var vol = "Vols"
    
    private var locationList = [
        Location(image: "fourSeasons", name: "Four Seasons", location: "199 George Street, Sydney, NSW 2000", price: 234.99, numberBedR: 1, numberBathR: 1),
        Location(image: "ImageSydney2", name: "Villa", location: "East avenu", price: 344.00, numberBedR: 2, numberBathR: 3)
    ]
    private var volList = [
        Location(image: "ImageSydney2", name: "Paris -> Sydney", location: "centre ville", price: 234, numberBedR: 1, numberBathR: 1),
        Location(image: "ImageSydney3", name: "Paris -> Sydney", location: "centre ville", price: 123, numberBedR: 1, numberBathR: 1)
    ]
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                
                //Affichage des informations sur la destination récupéré sur DetailInformations
                DetailInformation(title: "Sydney, Australie", descriptionIconHealth: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconCost: "Si vous faites vos courses au supermarché, vous pouvez vous en sortir pour 20 AU$ (13 €) par personne et par jour.La taxe sur les biens et les services (goods and services tax, GST) est de 10 %. Elle est incluse dans les prix affichés (c’est la loi). ", descriptionIconSecurity: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconWeather: "Le climat y est subtropical humide, c’est-à-dire que les étés sont chauds et pluvieux, les hivers en général assez courts et frais.", description: "Sydney, installée sur une superbe baie, est la plus ancienne ville d’Australie et un port important. Fondée à la fin du XIXe siècle par les colons européens, elle est aujourd’hui la ville la plus peuplée du pays. Sydney a réussi le pari d’entrer d’un bond dans le XXIe siècle tout en gardant un charme ancien.")
                Spacer()
                
                //Récupération de la liste des locations/hotels
                Picker("Event", selection: $location) {
                    ForEach(pickerEvent, id: \.self) { location in
                            Text(location)
                                .font(.largeTitle)
                    }
                    
                }.pickerStyle(.segmented)
                    .padding()
                VStack(alignment: .leading) {
                    if location == "Locations" {
                        ForEach(locationList) { listLocation in
                            HStack {
                                Image(listLocation.image)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                VStack(alignment: .leading) {
                                    Text(listLocation.name)
                                        .font(.headline)
                                    Text(listLocation.location)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    HStack {
                                        Image(systemName: "bed.double.fill")
                                        Text("\(listLocation.numberBedR)")
                                    }.font(.system(size: 15))
                                    HStack {
                                        Image(systemName: "shower.fill")
                                        Text("\(listLocation.numberBathR) ")
                                    }.font(.system(size: 15))
                                        .padding(.leading,6)
                                    HStack {
                                        Text("\(listLocation.price, specifier: "%.2f")€")
                                            .font(.headline)
                                        Text("/nuit pour deux")
                                            .font(.system(size: 10))
                                    }.padding(.top, 1)
                                }
                                Spacer()
                                HStack {
                                    Link("Louer",
                                         destination: URL(string: "https://www.google.fr")!)
                                    .padding(10)
                                    .background(Color("MyBlue"))
                                    .foregroundColor(.white)
                                .cornerRadius(10)
                                }
                                
                                Spacer()
                            }.padding(.leading, 20)
                        }
                        
                    } else if vol == "Vols" {
                        ForEach(volList) { listVol in
                            HStack {
                                Image(listVol.image)
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text(listVol.name)
                                    .font(.title)
                            }
                        }
                    } else {
                        Text("Aucun bon plan existant")
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


struct Location: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var location: String
    var price: Float
    var numberBedR: Int
    var numberBathR: Int
}


// faire ajout favoris et ajout déjà visité



/**Link(destination: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
 Label("Share", systemImage: "link.circle.fill")
 }*/


//VStack(alignment: .center) {
//    Link("Louer",
//         destination: URL(string: "https://www.google.fr")!)
//    .padding(10)
//    .background(Color("MyBlue"))
//    .foregroundColor(.white)
//    .cornerRadius(10)
//}
