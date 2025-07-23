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


//struct quiz: View{
//
//    let buttons = ["Pieds dans l'eau", "Bataille de neige", "Randonnée"]//quiz1
//
//
//    @State public var buttonSelected: Int?
//    @State private var changeColor: Bool = false
//
//    var body: some View {
//        //        NavigationView{
//        VStack(spacing: 50){
//            Text("Quel est ton délire ?")
//                .font(.largeTitle)
//                .padding(.bottom, 50)
//            ForEach(0..<buttons.count, id:\.self) { button in
//                Button(action: {
//                    self.buttonSelected = button })
//                {
//                    Text("\(self.buttons[button])")
//                        .padding(20)
//                        .foregroundColor(buttonSelected == button ? Color.white : Color("MyBlue"))
//                        .background(buttonSelected == button ? Color("MyBlue") : Color("MyYellow") )
//                        .clipShape(Capsule())
//                }
//            }
//            .navigationTitle("Surprenez-moi !")
//        }
//        Spacer(minLength: 30)
//        NavigationLink(destination: Quiz1(), label: {
//            Text("Suivant")
//                .foregroundColor(Color("MyBlue"))
//                .background(Color("MyYellow"))
//                .font(.largeTitle)
//                .clipShape(Capsule())
//        })
//        //        }
//    }
//}

struct Jemaitrise: View {
    @State var toto = 0
    @State var color = Color.white
    var body: some View {
        VStack{
            Image("LOGO")
            Text("Selectionnez vos dates de voyage")
            HStack{
                ZoneClickable(text: "Jour")
                ZoneClickable(text: "Mois")
                ZoneClickable(text: "Nombre de personnes")
            }
            Text("Selectionnez le lieu de votre sejour")//permettre la selection de pays dans une liste
            HStack{
                
                ZoneClickable(text: "Amerique")
                ZoneClickable(text: "Europe")
                ZoneClickable(text: "Le monde entier")
            }
            Text("Selectionnez le lieu de votre residence")//faire un two-way Binding : qui me permet d'envoyer une info et de la récupérer visuellement. ici récupérer des chiffres
            HStack{
                ZoneClickable(text: "Hotel")
                ZoneClickable(text: "Maison hote")
                ZoneClickable(text: "Appartement Maison")
            }
            Text("Quel est votre budget ?")
            HStack{
                ZoneClickable(text: "- de 1000€")
                ZoneClickable(text: "- de 3000€")
                ZoneClickable(text: "+ 5000€")
                
            }
            .padding(9)
            
            
            Button(action :{//redirection partie Lassana
                Suggestions(returnToQuizz: $toto)
            }, label:{
                Text("C'est parti !")
                    .foregroundColor(.red)
                    .padding(30)
                    .background(.mint)
                    .cornerRadius(10)
                
            })
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
        //        NavigationView{
        VStack(spacing : 50){
            //            Image("LOGO")
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
        //NavigationView{
        VStack(spacing : 50){
            //            Image("LOGO")
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
                    //.foregroundColor(buttonSelected == button ? Color.white : Color("MyBlue"))
                    //.background(buttonSelected == button ? Color("MyBlue") : Color("MyOrange")  )
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
    
    // }
}

struct Quiz3: View {
    let buttons = ["-1000€", "-3000€", "+5000€"]
    
    @State public var buttonSelected: Int?
    @State private var changeColor: Bool = false
    @Binding var fifthView: Int
    var body: some View {
        //NavigationView{
        VStack(spacing : 50){
            
            
            //            Image("LOGO")
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
            //            NavigationLink(destination: Suggestions(), label: {
            //redirection lassana
            .font(.title2)
            .foregroundColor(Color("MyBlue"))
            .padding(20)
            .background(Color("MyYellow"))
            .clipShape(Capsule())
            
            //            })
            
        
        }
        
        /*ZStack {
                     Image("JeromeNew")
                         .resizable()
                         .offset(x:60 ,y:200)
                     .frame(width:170 , height:270 )
                 }*/
    }
    // }
}

struct ProjetVoyageAppMobile_Previews: PreviewProvider {
    static var previews: some View {
        ProjetVoyageAppMobile(firstVue: .constant(0))
    }
}

