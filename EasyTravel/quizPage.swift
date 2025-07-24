//
//  ProjetVoyageAppMobile.swift
//  APP VOYAGE
//
//  Created by Marlène on 08/12/2022.
//

import SwiftUI

struct ProjetVoyageAppMobile: View {
    @Binding var firstVue: Int
    var body: some View {
        NavigationView{///tout ce qui est à l'interieur est naviguable
            ZStack {
                VStack{
                    //                    Spacer()
                    Image("LOGO")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    Spacer()
                    Text("Choississez une aventure")
                        .bold(true)
                        .font(.title)
                        .padding(30)
                    
                    VStack(spacing: 40) {
                        NavigationLink(
                            destination: IsClicQuizNavigation(
                                textQuestion: "Quel est ton délire ?",
                                textReponse: ["Urbain", "Bataille de neige", "Randonnée"]
                            ) {
                                // destination après "Suivant" dans IsClicQuiz
                                Quiz1(thirdView: $firstVue)
                            }, label: {///le navigationLink est pour la redirection / le button = action exemple :  changement de couleur, chrono, addition.....
                                Text("Suprenez-moi")
                                    .frame(maxWidth: 300)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color("MyYellow"))
                                    .cornerRadius(10)
                            })
                        
                        NavigationLink(destination: Jemaitrise(returnToSuggestion: $firstVue), label: {///le navigationLink est pour la redirection / le button = action exemple :  changement de couleur, chrono, addition.....
                            Text("Je maîtrise")
                                .frame(maxWidth: 300)
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("MyBlue"))
                                .cornerRadius(10)
                        })
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }//fin NavView
    }
}

struct Jemaitrise: View {
    @State var toto = 0
    @State var color = Color.white
    @State private var showDatePicker = false // Pour le picker Date
    @State private var selectedDate = Date() //Pour la date selectionnée
    @State private var selectedPeople = 1
    let peopleOptions = Array(1...20) // selection du nombre de personnes allant de 1 à 20 personnes
    @State private var selectedCountry = "Europe"
    let countries = ["Amérique", "Europe", "Asie", "Afrique", "Océanie"]
    @State private var selectedHome = "Hôtel"
    let homes = ["Hôtel", "Maison", "Villa", "Appartement","Camping"]
    @State private var selectedBudget = 500
    let budgetOptions = Array(500...2000)
    @Binding var returnToSuggestion: Int
    
    var body: some View {
        VStack{
            Image("LOGO")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Selectionnez vos dates de voyage")
            HStack {
                ZoneClickable(text: selectedDate.formatted(date: .abbreviated, time: .omitted)) {
                    withAnimation {
                        showDatePicker.toggle()
                    }
                }
                Menu {
                    Picker("Nombre de personnes", selection: $selectedPeople) {
                        ForEach(peopleOptions, id: \.self) { number in
                            Text("\(number) personne\(number > 1 ? "s" : "")")
                                .tag(number)
                        }
                    }
                } label: {
                    ZoneClickable(text: "\(selectedPeople) personne\(selectedPeople > 1 ? "s" : "")")
                }
            }
            .padding(.horizontal)
            
            if showDatePicker {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .transition(.opacity)
                .padding(.horizontal)
            }
            
            Text("Selectionnez le lieu de votre sejour")//permettre la selection de pays dans une liste
            HStack{
                Menu {
                    Picker("Destination", selection: $selectedCountry) {
                        ForEach(countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                } label: {
                    ZoneClickable(text: selectedCountry)
                }
            }
            
            Text("Selectionnez le lieu de votre residence")//faire un two-way Binding : qui me permet d'envoyer une info et de la récupérer visuellement. ici récupérer des chiffres
            HStack{
                Menu {
                    Picker("Home", selection: $selectedHome) {
                        ForEach(homes, id: \.self) { home in
                            Text(home).tag(home)
                        }
                    }
                } label: {
                    ZoneClickable(text: selectedHome)
                }
            }
            
            Text("Quel est votre budget ?")
            HStack{
                Menu {
                    Picker("Budget", selection: $selectedBudget) {
                        ForEach(budgetOptions, id: \.self) { number in
                            Text("\(number) €")
                        }
                    }
                } label: {
                    ZoneClickable(text: "\(selectedBudget) €")
                }
                
            }
            .padding(9)
            
            Button {
                returnToSuggestion = 1 // redirige vers Suggestions
            } label: {
                Text("C’est parti !")
                    .frame(maxWidth: 300)
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding()
                    .background(Color("MyYellow"))
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Je maîtrise !")
    }
}



struct Quiz1: View {
    @Binding var thirdView: Int
    
    var body: some View {
        IsClicQuizNavigation(
            textQuestion: "Où veux-tu chiller ?",
            textReponse: ["Amérique", "Europe", "Asie"]
        ) {
            Quiz2(fourthView: $thirdView)
        }
    }
}


struct Quiz2: View {
    @Binding var fourthView: Int
    
    @State private var departDate = Date()
    @State private var retourDate = Date()
    @State private var showAlert = false
    @State private var navigate = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Quand veux-tu partir ?")
                .font(.largeTitle)
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Date de départ")
                        .font(.headline)
                    DatePicker("Départ", selection: $departDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading) {
                    Text("Date de retour")
                        .font(.headline)
                    DatePicker("Retour", selection: $retourDate, in: departDate..., displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                if retourDate < departDate {
                    showAlert = true
                } else {
                    navigate = true
                }
            }) {
                Text("Suivant")
                    .frame(maxWidth: 300)
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding(20)
                    .background(Color("MyYellow"))
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Date invalide"),
                    message: Text("La date de retour ne peut pas être avant la date de départ."),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Surprenez-moi !")
        .navigationDestination(isPresented: $navigate) {
            Quiz3(fifthView: $fourthView)
        }
    }
}


struct Quiz3: View {
    @Binding var fifthView: Int
    
    var body: some View {
        VStack(spacing: 50) {
            IsClicQuizAction(
                textQuestion: "Quel est ton budget ?",
                textReponse: ["- de 1000€", "- de 3000€", "+ de 5000€"],
                onValidate: {
                    fifthView = 1
                }
            )
        }
    }
}


struct ProjetVoyageAppMobile_Previews: PreviewProvider {
    static var previews: some View {
        ProjetVoyageAppMobile(firstVue: .constant(0))
    }
}

