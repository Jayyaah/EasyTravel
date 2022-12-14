//
//  Detail.swift
//  EasyTravel
//
//  Created by Valentine on 06/12/2022.
//

import SwiftUI

struct Detail: View {
    
    let selectedVoyage: Voyage2
    //Constante pour les récupérer les couleurs présentes dans Assets
    let orange:Color = Color("MyOrange")
    let blue:Color = Color("MyBlue")
    let yellow:Color = Color("MyYellow")
    var pickerEvent = ["Locations", "Vols"]
    @State private var location = "Locations"
    @State private var vol = "Vols"
    @State private var isFavorite: String = "Ajouter aux favoris"
    @State private var isVisited: String = "Déjà visité"
    var body: some View {
        
        
        ZStack(alignment:.bottom) {
            ScrollView {
                ZStack {
                    VStack {
                        
                        //Affichage des informations sur la destination récupéré sur DetailInformations
                        DetailInformation(selectedVoyage: selectedVoyage)
                        Spacer()
                        
                        HStack(spacing: 10) {
                            //Bouton ajout aux favoris
                            Button {
                                isFavorite = "Ajouté"
                            } label: {
                                HStack {
                                    Image(systemName: "heart.fill")
                                    Text(isFavorite)
                                }.padding(10)
                                    .background(Color("MyBlue"))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            
                            //Bouton ajoutes à mes voyages
                            Button {
                                isVisited = "Ajouté"
                            } label: {
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                    Text(isVisited)
                                }.padding(10)
                                    .background(Color("MyBlue"))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                        
                        //Récupération de la liste des locations/hotels
                        Picker("Event", selection: $location) {
                            ForEach(pickerEvent, id: \.self) { location in
                                Text(location)
                                    .font(.largeTitle)
                            }
                            
                        }.pickerStyle(.segmented)
                            .padding()
                        VStack {
                            if location == "Locations" {
                                Text("Ven. 16/12 au Ven. 23/12")
                                LocationsList(locationList: selectedVoyage)
                                
                            } else if vol == "Vols" {
                                Text("Ven. 16/12 au Ven. 23/12")
                                VolsList(voyageList: selectedVoyage)
                            } else {
                                Text("Aucun bon plan existant")
                            }
                            
                        }
                    }
                    
                        
                    
                }
            }
// Bouton flottant
//            VStack {
//                HStack {
//                    Button {
//                        if isFavorite {
//
//                        }
//                    } label: {
//                        HStack {
//                            Image(systemName: "heart.fill")
//                            Text("Ajouter aux favoris")
//                        }.padding(10)
//                            .background(Color("MyOrange"))
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                    }
//
//
//                    Button {
//
//                    } label: {
//                        HStack {
//                            Image(systemName: "checkmark.circle.fill")
//                            Text("Déjà visité")
//                        }.padding(10)
//                            .background(Color("MyBlue"))
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                    }
//
//                }
//            }

        }
    }
    
   
    
    //Permet de recupérer les différentes informations de locations/hôtel sur la destination
    struct Location: Identifiable {
        var id = UUID()
        var image: String
        var name: String
        var location: String
        var price: Int
        var numberBedR: Int
        var numberBathR: Int
        var url: String
    }
    
    
    //Permet de récupérer les différentes informations concernant les vols disponible pour ce rendre à la destination
    struct Vol: Identifiable {
        var id = UUID()
        var logoCompagnyOneWay: String
        var logoCompagnyReturn: String
        var departureOneWay: String
        var departureReturn: String
        var arrivalOneWay: String
        var arrivalReturn: String
        var compagnyOneWay: String
        var compagnyReturn: String
        var price: Int
        var departureHoursOneWay: String
        var departureHoursReturn: String
        var arrivalHoursOneWay: String
        var arrivalHoursReturn: String
        var urlVol: String
    }
    
    //Extration de la liste des vols
    struct VolsList: View {
        var voyageList: Voyage2
        var body: some View {
            VStack {
                ForEach(arrayVoyages.filter{$0.nom == voyageList.nom }) { listVol in
                    //Affichage de la liste des différentes locations/hôtels proposé dans la zone de la destination
                    VStack {
                        //Vol Aller
                        
                        HStack {
                            Image(listVol.logoCompagnyOneWay)
                                .resizable()
                                .frame(width: 30, height: 30)
                            VStack {
                                Text(listVol.departureHoursOneWay)
                                    .bold()
                                Text(listVol.departureOneWay)
                            }.font(.system(size: 15))
                            Image(systemName: "airplane.departure")
                            Image(systemName: "line.diagonal")
                                .rotationEffect(Angle(degrees: 45))
                            Image(systemName: "airplane.arrival")
                            HStack {
                                VStack {
                                    HStack {
                                        Text(listVol.arrivalHoursOneWay)
                                            .bold()
                                    }
                                    Text(listVol.arrivalOneWay)
                                }
                            }.font(.system(size: 15))
                            Spacer()
                        }
                        //Vol retour
                        HStack {
                            Image(listVol.logoCompagnyReturn)
                                .resizable()
                                .frame(width: 30, height: 30)
                            VStack {
                                Text(listVol.departureHoursReturn)
                                    .bold()
                                Text(listVol.departureReturn)
                            }.font(.system(size: 15))
                            Image(systemName: "airplane.departure")
                            Image(systemName: "line.diagonal")
                                .rotationEffect(Angle(degrees: 45))
                            Image(systemName: "airplane.arrival")
                            VStack {
                                Text(listVol.arrivalHoursReturn)
                                    .bold()
                                Text(listVol.arrivalReturn)
                            }.font(.system(size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("\(listVol.priceVol)€")
                                .bold()
                                .padding(.leading, 10)
                            Link("Acheter",
                                 destination: URL(string: listVol.urlVol)!)
                            .padding(10)
                            .background(Color("MyBlue"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }.padding()
                        .border(.gray, width: 1).frame(width: 370, height: 190).cornerRadius(5)
                }
            }
        }
    }
    
    struct LocationsList: View {
        var locationList: Voyage2
//        var locationRow = [
//            Location(image: "fourSeasons", name: "Four Seasons", location: "199 George Street, Sydney, NSW 2000", price: 353, numberBedR: 1, numberBathR: 1, url: "https://www.booking.com/Share-AGxvU7"),
//            Location(image: "ab", name: "Fairfield Heights", location: "Fairfield Heights, Sydney, Australie", price: 134, numberBedR: 3, numberBathR: 1, url: "https://www.abritel.fr/location-vacances/p2595909vb?adultsCount=2&noDates=true&uni_id=3166326")
//        ]
        var body: some View {
            ForEach(arrayVoyages.filter{$0.nom == locationList.nom }) { listLocation in
                //Affichage de la liste des différentes locations/hôtels proposé dans la zone de la destination
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
                            Text("\(listLocation.priceLocation)€")
                                .font(.headline)
                            Text("/ nuit")
                                .font(.system(size: 15))
                        }.padding(.top, 1)
                    }
                    Spacer()
                    //Bouton louer qui permet d'être redirigé vers le site de location
                    HStack {
                        Link("Louer",
                             destination: URL(string: listLocation.url)!)
                        .padding(10)
                        .background(Color("MyBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                }.padding(.leading, 20)
                    .border(.gray, width: 1).frame(width: 370, height: 130).cornerRadius(5)
            }
        }
    }
}


struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(selectedVoyage: arrayVoyages[0])
    }
}
