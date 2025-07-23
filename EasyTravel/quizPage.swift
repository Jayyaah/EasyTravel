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
                    Text("Choississez une aventure")
                        .bold(true)
                        .font(.title)
                        .padding(30)
                    //                    Spacer()
                    VStack(spacing: 40) {
                        NavigationLink(destination: IsClicQuiz( secondVue: $firstVue), label: {///le navigationLink est pour la redirection / le button = action exemple :  changement de couleur, chrono, addition.....
                            Text("Suprenez-moi")
                                .frame(maxWidth: 300)
                                .foregroundColor(Color("MyBlue"))
                                .padding(35)
                                .background(Color("MyYellow"))
                                .cornerRadius(10)
                        })
                        
                        NavigationLink(destination: Jemaitrise(), label: {///le navigationLink est pour la redirection / le button = action exemple :  changement de couleur, chrono, addition.....
                            Text("Je maîtrise")
                                .frame(maxWidth: 300)
                                .foregroundColor(.white)
                                .padding(35)
                                .background(Color("MyBlue"))
                                .cornerRadius(10)
                        })
                    }
                    
                    Spacer()
                    
                }
                Image("JeromeNew")
                    .resizable()
                    .offset(x:60 ,y:260)
                    .frame(width:270 , height:370 )
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
            
            
            ZoneClickable(text: "Cest parti !")
                .colorInvert()
        }
        .navigationTitle("Je maîtrise !")
    }
}



struct Quiz1: View {
    
    let buttons = ["Amérique", "Europe", "Le monde entier"]
    
    @State public var buttonSelected: Int?
    @State private var changeColor: Bool = false
    @Binding var thirdView: Int
    var body: some View {
        VStack(spacing : 50){
            Text("Où veux-tu chiller ?")
                .font(.largeTitle)
                .padding(.bottom, 50)
            ForEach(0..<buttons.count, id:\.self) { button in
                Button(action: {
                    self.buttonSelected = button
                }) {
                    Text("\(self.buttons[button])")
                        .font(.title2)
                        .padding()
                        .foregroundColor(buttonSelected == button ? Color.white : Color.white)
                        .background(buttonSelected == button ? Color("MyOrange"): Color("MyBlue") )
                        .clipShape(Capsule())
                }
                .navigationTitle("Surprenez-moi !")
            }
            NavigationLink(destination: Quiz2(fourthView: $thirdView), label: {
                Text("Suivant")
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding(20)
                    .background(Color("MyYellow"))
                    .cornerRadius(20)
                    .clipShape(Capsule())
            })
        }
        
    }
}

struct Quiz2: View{
    let buttons = ["Sélectionne ta date "]
    
    @State public var buttonSelected: Int?
    @State private var changeColor: Bool = false
    @Binding var fourthView: Int
    var body: some View {
        VStack(spacing : 50){
            Text("Quand veux-tu partir ?")
                .font(.largeTitle)
                .padding(.horizontal)
                .font(.largeTitle)
                .padding(.bottom, 50)
            
            ForEach(0..<buttons.count, id:\.self) { button in
                Button(action: {
                    self.buttonSelected = button
                }) {
                    Text("\(self.buttons[button])")
                        .padding()
                        .foregroundColor(buttonSelected == button ? Color.black : Color.black)
                        .background(buttonSelected == button ? Color.white: Color.white )
                        .clipShape(Capsule())
                    
                }
                .navigationTitle("Surprenez-moi !")
                
                VStack{
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Aller") })
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Retour") })
                }.padding()
                
            }
            NavigationLink(destination: Quiz3(fifthView: $fourthView), label: {
                Text("Suivant")
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding(20)
                    .background(Color("MyYellow"))
                    .clipShape(Capsule())
            })
        }
    }
}

struct Quiz3: View {
    let buttons = ["-1000€", "-3000€", "+5000€"]
    
    @State public var buttonSelected: Int?
    @State private var changeColor: Bool = false
    @Binding var fifthView: Int
    var body: some View {
        VStack(spacing : 50){
            Text("Combien tu as ?")
                .font(.largeTitle)
                .padding(.bottom, 50)
            ForEach(0..<buttons.count, id:\.self) { button in
                Button(action: {
                    self.buttonSelected = button
                }) {
                    Text("\(self.buttons[button])")
                        .font(.title2)
                        .padding()
                        .foregroundColor(buttonSelected == button ? Color.white : Color.white)
                        .background(buttonSelected == button ? Color("MyOrange"): Color("MyBlue") )
                        .clipShape(Capsule())
                }
                .navigationTitle("Surprenez-moi !")
            }
            Button("C'est parti !", action: {
                fifthView = 1
            })
            .font(.title2)
            .foregroundColor(Color("MyBlue"))
            .padding(20)
            .background(Color("MyYellow"))
            .clipShape(Capsule())
        }
    }
}

struct ProjetVoyageAppMobile_Previews: PreviewProvider {
    static var previews: some View {
        ProjetVoyageAppMobile(firstVue: .constant(0))
    }
}

