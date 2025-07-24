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
    private let orange = Color("MyOrange")
    private let blue = Color("MyBlue")
    private let yellow = Color("MyYellow")

    // Picker entre locations et vols
    private let pickerOptions = ["Locations", "Vols"]
    @State private var selectedPicker = "Locations"

    // Favoris / Visite
    @State private var isFavorite = false
    @State private var isVisited = false

    // Dates dynamiques pour le séjour (valeurs de test, à lier à la logique réelle)
    private let dateDepart = Date()
    private let dateRetour = Calendar.current.date(byAdding: .day, value: 7, to: Date())!

    private var dateRangeText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E. dd/MM"
        formatter.locale = Locale(identifier: "fr_FR")
        return "\(formatter.string(from: dateDepart)) au \(formatter.string(from: dateRetour))"
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 20) {

                    //Affichage des informations sur la destination récupéré sur DetailInformations
                    DetailInformation(selectedVoyage: selectedVoyage)

                    //Boutons ajout favoris / visité
                    HStack(spacing: 12) {
                        Button(action: { isFavorite = true }) {
                            Label(isFavorite ? "Ajouté" : "Ajouter aux favoris", systemImage: "heart.fill")
                                .padding()
                                .background(blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }

                        Button(action: { isVisited = true }) {
                            Label(isVisited ? "Ajouté" : "Déjà visité", systemImage: "checkmark.circle.fill")
                                .padding()
                                .background(blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }

                    //Récupération de la liste des locations/hotels
                    Picker("Choix", selection: $selectedPicker) {
                        ForEach(pickerOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    VStack(spacing: 8) {
                        Text(dateRangeText) // affichage des dates dynamiques formatées
                            .font(.headline)

                        if selectedPicker == "Locations" {
                            LocationsList(locationList: selectedVoyage)
                        } else {
                            VolsList(voyageList: selectedVoyage)
                        }
                    }
                }
                .padding(.bottom, 60)
            }
        }
    }
}

//Permet de recupérer les différentes informations de locations/hôtel sur la destination
struct LocationsList: View {
    var locationList: Voyage2

    var body: some View {
        ForEach(arrayVoyages.filter { $0.nom == locationList.nom }) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .frame(width: 120, height: 120)

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.name).font(.headline)
                    Text(item.location).font(.subheadline).foregroundColor(.gray)

                    HStack {
                        Label("\(item.numberBedR)", systemImage: "bed.double.fill")
                        Label("\(item.numberBathR)", systemImage: "shower.fill")
                    }.font(.footnote)

                    HStack {
                        Text("\(item.priceLocation)€").font(.headline)
                        Text("/ nuit").font(.footnote)
                    }

                    //Bouton louer qui permet d'être redirigé vers le site de location
                    Link("Louer", destination: URL(string: item.url)!)
                        .padding(6)
                        .background(Color("MyBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
            .frame(width: 370, height: 130)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
        }
    }
}

//Permet de récupérer les différentes informations concernant les vols disponible pour ce rendre à la destination
struct VolsList: View {
    var voyageList: Voyage2

    var body: some View {
        ForEach(arrayVoyages.filter { $0.nom == voyageList.nom }) { vol in
            VStack(spacing: 10) {
                //Vol Aller
                VolRow(
                    logo: vol.logoCompagnyOneWay,
                    departure: vol.departureOneWay,
                    departureHour: vol.departureHoursOneWay,
                    arrival: vol.arrivalOneWay,
                    arrivalHour: vol.arrivalHoursOneWay
                )

                //Vol retour
                VolRow(
                    logo: vol.logoCompagnyReturn,
                    departure: vol.departureReturn,
                    departureHour: vol.departureHoursReturn,
                    arrival: vol.arrivalReturn,
                    arrivalHour: vol.arrivalHoursReturn
                )

                HStack {
                    Text("\(vol.priceVol)€").bold()
                    Link("Acheter", destination: URL(string: vol.urlVol)!)
                        .padding(6)
                        .background(Color("MyBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(width: 370, height: 190)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
        }
    }
}

//Affichage d'une ligne de vol (aller ou retour)
struct VolRow: View {
    var logo: String
    var departure: String
    var departureHour: String
    var arrival: String
    var arrivalHour: String

    var body: some View {
        HStack(spacing: 8) {
            Image(logo)
                .resizable()
                .frame(width: 30, height: 30)

            VStack(alignment: .leading) {
                Text(departureHour).bold()
                Text(departure)
            }.font(.footnote)

            Image(systemName: "airplane.departure")
            Image(systemName: "line.diagonal")
                .rotationEffect(.degrees(45))
            Image(systemName: "airplane.arrival")

            VStack(alignment: .leading) {
                Text(arrivalHour).bold()
                Text(arrival)
            }.font(.footnote)

            Spacer()
        }
    }
}

//Preview
struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(selectedVoyage: arrayVoyages[0])
            .previewDisplayName("Détail Destination")
    }
}
