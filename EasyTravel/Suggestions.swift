//
//  example.swift
//  premier_voyages
//
//  Created by Apprenant84 on 06/12/2022.
//

import SwiftUI

struct Voyage2: Identifiable {
    //detail sur la destination
    var id = UUID()
    let nom: String
    let pays: String
    var prixDuVoyage: Double
    let imageDeLaDestination: [String]
    var iconDescription: [IconDescription]
    let icone_coherence : String
    var coherenceDesSuggestions : Int
    let detail: Bool = false
    var description: String
    
    //Information sur le vol
    var logoCompagnyOneWay: String
    var logoCompagnyReturn: String
    var departureOneWay: String
    var departureReturn: String
    var arrivalOneWay: String
    var arrivalReturn: String
    var compagnyOneWay: String
    var compagnyReturn: String
    var priceVol: Int
    var departureHoursOneWay: String
    var departureHoursReturn: String
    var arrivalHoursOneWay: String
    var arrivalHoursReturn: String
    var urlVol: String
    
    //information sur la location
    var image: String
    var name: String
    var location: String
    var priceLocation: Int
    var numberBedR: Int
    var numberBathR: Int
    var url: String
}

struct IconDescription: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var color: Color
    var description: String
}

var arrayDescriptionIcon = [
    IconDescription(name: "Sécurité", image: "checkmark.shield.fill", color: .green, description: "Blablablablablablab"),
    IconDescription(name: "Climat", image: "cloud.sun.rain.fill", color: .green, description: "Blablablablablablab"),
    IconDescription(name: "Prix", image: "dollarsign", color: .orange, description: "Blablablablablablab"),
    IconDescription(name: "Santé", image: "cross.fill", color: .red, description: "Blablablablablablab"),
]

let arrayVoyages = [
    //Tokyo
    Voyage2(nom: "Tokyo", pays:"Japon", prixDuVoyage: 119, imageDeLaDestination: ["Tokyo1", "Tokyo2", "Tokyo3"], iconDescription: arrayDescriptionIcon, icone_coherence: "gauge.medium", coherenceDesSuggestions: 45, description: "La ville de Tokyo est la riche et gigantesque capitale du Japon et sa plus grande ville, débordant de culture, de commerce et surtout d'habitants. Étant la zone urbaine la plus densément peuplée au monde, Tokyo est une métropole fascinante qui mélange les influences étrangères, la culture de consommation et le commerce mondial avec les vestiges de la capitale de l'ancien Japon. Mélangeant l'électronique moderne, les gratte-ciels étincelants, les cerisiers en fleurs et le Palais impérial, c'est une ville qui représente toute l'entendue de l'histoire et la culture japonaise.", logoCompagnyOneWay: "KLM", logoCompagnyReturn: "AF", departureOneWay: "CDG·Paris", departureReturn: "NRT·Tokyo", arrivalOneWay: "NRT·Tokyo", arrivalReturn: "CDG·Paris", compagnyOneWay: "KLM", compagnyReturn: "AirFrance", priceVol: 1560, departureHoursOneWay: "12:40", departureHoursReturn: "10:55", arrivalHoursOneWay: "19:25+1", arrivalHoursReturn: "17:40", urlVol: "https://kay.ac/1fNfNy", image: "TokyoHotel", name: "APA Hotel Roppongi SIX", location: "106-0032 Tokyo, Minato-ku, Roppongi 2-3-11", priceLocation: 119, numberBedR: 1, numberBathR: 1, url: "https://www.booking.com/Share-hIctCB"),
    //Rome
    Voyage2(nom: "Rome", pays:"Italie", prixDuVoyage: 124, imageDeLaDestination: ["Rome3", "Rome2", "Rome1"], iconDescription: arrayDescriptionIcon, icone_coherence: "gauge.medium", coherenceDesSuggestions: 45, description: "Rome, la Ville Éternelle, est extrêmement riche et vivante. Née au VIIIe siècle av. J.-C., elle a rapidement pris un essor considérable pour devenir le centre d'un empire couvrant l'ensemble du bassin méditerranéen et une bonne partie de l'Europe occidentale. La chute de l'empire païen, après quelques décennies de troubles, a laissée la place au pouvoir papal qui a alors couvert la ville d'églises baroques qui sont une des merveilles de Rome. C'est donc une véritable ville-palimpseste, formée de couches successives, que découvre le visiteur, tombant au gré de ses errances sur des merveilles cachées au milieu d'une ville toujours vivante.", logoCompagnyOneWay: "AF", logoCompagnyReturn: "AF", departureOneWay: "CDG·Paris", departureReturn: "FCO·Rome", arrivalOneWay: "FCO·Rome", arrivalReturn: "CDG·Paris", compagnyOneWay: "AirFrance", compagnyReturn: "AirFrance", priceVol: 129, departureHoursOneWay: "07:10", departureHoursReturn: "16:45", arrivalHoursOneWay: "18:55", arrivalHoursReturn: "09:15", urlVol: "https://kay.ac/wyxThG", image: "RomeHotel", name: "Hotel Colosseum", location: "Via Sforza 10, Rione Monti, 00184 Rome, Italy", priceLocation: 124, numberBedR: 1, numberBathR: 1, url: "https://www.booking.com/Share-f819Nd"),
    //Sydney
    Voyage2(nom: "Sydney", pays:"Australie", prixDuVoyage: 300, imageDeLaDestination: ["ImageSydney2", "ImageSydney1", "ImageSydney3", "ImageSydney4"], iconDescription: arrayDescriptionIcon, icone_coherence: "gauge.medium", coherenceDesSuggestions: 45, description: "Sydney, installée sur une superbe baie, est la plus ancienne ville d’Australie et un port important. Fondée à la fin du XIXe siècle par les colons européens, elle est aujourd’hui la ville la plus peuplée du pays. Sydney a réussi le pari d’entrer d’un bond dans le XXIe siècle tout en gardant un charme ancien.", logoCompagnyOneWay: "QF", logoCompagnyReturn: "QF", departureOneWay: "CDG·Paris", departureReturn: "SYD·Sidney", arrivalOneWay: "SYD·Sydney", arrivalReturn: "CDG·Paris", compagnyOneWay: "AirFrance", compagnyReturn: "AirFrance", priceVol: 9405, departureHoursOneWay: "14:25", departureHoursReturn: "06:00", arrivalHoursOneWay: "22:30", arrivalHoursReturn: "19:30", urlVol: "https://kay.ac/fE-Kbo", image: "fourSeasons", name: "Four Seasons", location: "199 George Street, Sydney, NSW 2000", priceLocation: 300, numberBedR: 1, numberBathR: 1, url: "https://www.booking.com/Share-5INRO4"),
]


struct Suggestions: View { // --------debut view-------------
    
    var body: some View { // --------debut some view-------------
        
      
        
        
       
        //var nbrLabel_SÛR: Int = 100
        //var nbrLabel_MOYEN: Int = 50
        //var nbrLabel_Pas_SÛR: Int = 25
        
        
        //-----------------------/Users/apprenant84/Downloads/Detail.swift-----------
        
        
        
        
        NavigationView {
            ScrollView { // --------debut scrollview-------------
                VStack {
                    /*HStack{
                     Text("Date Aller")
                     Spacer()
                     Text("Date Retour")
                     }*/
                    Spacer()
                    
                    ForEach(arrayVoyages){ destination in
                        
                        HStack {
                            Text(destination.nom)
                                .foregroundColor(.orange)
                                .fontWeight(.bold)
                                .font(.title)
                            
                            Spacer()
                            
                            Text("Prix à partir de \(destination.prixDuVoyage, specifier:"%.0f") €").bold()
                            
                        }.padding()
                        Image(destination.imageDeLaDestination[0])
                            .resizable()
                            .frame(width:340, height: 240)
                        //.listRowSeparator(.hidden)
                            .border(Color.gray, width: 2)
                        Spacer()
                            .frame(height:20)
                        
                        //----------debut partie icon signalisation----------
                        VStack (alignment: .leading) {
                            HStack{
                                VStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(destination.iconDescription[0].color)
                                    Text(destination.iconDescription[0].name)
                                        .font(.footnote)
                                    
                                }
                                VStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(destination.iconDescription[1].color)
                                    Text(destination.iconDescription[1].name)
                                        .font(.footnote)
                                }
                                VStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(destination.iconDescription[2].color)
                                    Text(destination.iconDescription[2].name)
                                        .font(.footnote)
                                }
                                VStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(destination.iconDescription[3].color)
                                    Text(destination.iconDescription[3].name)
                                        .font(.footnote)
                                    
                                }
                                
                                VStack {
                                    Image(systemName: destination.icone_coherence)
                                        .foregroundColor(.black)
                                        .font(.title)
                                    Text("\(destination.coherenceDesSuggestions)%")
                                        .font(.footnote)
                                    
                                }
                                
                                
                                Spacer()
                                
                                NavigationLink(
                                    destination: Detail(selectedVoyage: destination),
                                    
                                    label: {
                                        HStack {
                                            
                                            Text("Détails")
                                            
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .font(.system(size: 14))
                                                .background(Color("MyBlue"))
                                                .cornerRadius(100)
                                        }
                                        
                                    })
                                
                            }
                            Spacer()
                                .frame(height:40)
                            
                        }//----------fin partie icon signalisation----------
                        .padding()
                        
                        
                    }
                    Button{
                        
                    } label: {
                        Text("Modifier mes réponses")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color("MyOrange"))
                            .cornerRadius(100)
                    }
                } // --------fin scrollview-------------
                
            }
            .padding(2)
            .navigationTitle("Suggestions")
            
        }   // ---------fin navigation----------
        
        
    } // --------fin some view-------------
    
    struct example_Previews: PreviewProvider {
        static var previews: some View {
            Suggestions()
            
            
            
            
        }
    }
}
